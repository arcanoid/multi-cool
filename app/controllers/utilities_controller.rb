class UtilitiesController < ApplicationController
  def credit_card_validator
    @samples = []

    [ :amex,
      :maestro,
      :diners,
      :mastercard,
      :visa,
      :unionpay,
      :dankort,
      :elo,
      :discover,
      :hipercard,
      :jcb,
      :rupay,
      :solo,
      :switch ].each do |type|

      values = []

      1..5.times do
        values << CreditCardValidations::Factory.random(type)
      end

      @samples << {:type => type.to_s, :values => values}
    end

    return unless params[:cc_number].present?

    detector = CreditCardValidations::Detector.new(params[:cc_number])

    @verdict = detector.valid?
    @brand_name = detector.brand
  end

  def screenshot_snapper
    if params[:full_text].present?
      driver = Selenium::WebDriver.for :firefox

      urls = params[:full_text].split(/\r\n/)

      urls.each do |url|
        if url.present?
          directory_name = "#{Rails.root}/app/assets/images/screens/#{DateTime.now.strftime('%Y-%m-%d')}"
          FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)

          full_file_name = "#{directory_name}/#{url.gsub('.', '').gsub('http://', '').gsub('/', '_').gsub(/\W/, '').try(:slice, 0, 250)}.png"

          driver.get url
          driver.save_screenshot full_file_name
        end
      end

      driver.quit
    end

    @images = Dir.glob("app/assets/images/screens/*/*.png")
  end

  def qr_code_producer
    if params[:full_text].present?
      urls = params[:full_text].split(/\r\n/)

      urls.each do |url|
        directory_name = "#{Rails.root}/app/assets/images/qr_codes/#{DateTime.now.strftime('%Y-%m-%d')}"
        FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)

        full_file_name = "#{directory_name}/#{url.gsub('.', '').gsub('http://', '').gsub('/', '_').gsub(/\W/, '')}.png"

        qrcode = RQRCode::QRCode.new(url)

        qrcode.as_png( { :file => full_file_name,
                         :size => (params[:size].present? ? params[:size].to_i : 200) })
      end
    end

    @images = Dir.glob("app/assets/images/qr_codes/*/*.png")
  end

  def rss_feed_validator
    require 'feed_validator'

    if params[:url].present?
      @valid = false
      @site_url = params[:url]

      begin
        v = W3C::FeedValidator.new

        if v.validate_url(@site_url) && v.valid?
          @valid = true
        end

        @warnings = v.warnings
        @errors = v.errors
        @info = v.informations
      rescue Exception => e
        flash[:error] = e
      end
    end
  end

  def sprint_calculator
    if params[:member_names].present?
      @members = params[:member_names].lines.map(&:chomp)

      if params[:sprint_targets].present?
        @sprint_targets = params[:sprint_targets].lines.map(&:chomp)
      else
        @sprint_targets = []
      end

      if params[:sprint_title].present?
        @sprint_title = params[:sprint_title].chomp
      end

      if params[:sprint_starting_date].present? && params[:sprint_ending_date].present?
        if params[:holidays].present?
          national_holidays = params[:holidays].lines.map(&:chomp).map { |holiday| Date.parse(holiday) }
        else
          national_holidays = []
        end

        @starting_date = Date.parse(params[:sprint_starting_date])

        while @starting_date.saturday? || @starting_date.sunday? || national_holidays.include?(@starting_date)
          @starting_date = @starting_date + 1.day
        end

        @ending_date = Date.parse(params[:sprint_ending_date])

        while @ending_date.saturday? || @ending_date.sunday? || national_holidays.include?(@ending_date)
          @ending_date = @ending_date + 1.day
        end

        if params[:demo].present?
          @demo_date = @ending_date + params[:demo].to_i

          while @demo_date.saturday? || @demo_date.sunday? || national_holidays.include?(@demo_date)
            @demo_date = @demo_date - 1.day
          end
        end

        if params[:code_review].present?
          @code_review_date = @ending_date + params[:code_review].to_i

          while @code_review_date.saturday? || @code_review_date.sunday? || national_holidays.include?(@code_review_date)
            @code_review_date = @code_review_date - 1.day
          end
        end

        @release_date = @ending_date.tomorrow

        while @release_date.saturday? || @release_date.sunday? || national_holidays.include?(@release_date)
          @release_date = @release_date + 1.day
        end

        if params[:captain_name].present?
          @captain = params[:captain_name].chomp
        end

        if params[:vice_captain_name].present?
          @vice_captain = params[:vice_captain_name].chomp
        end

        @issues = []

        @issues << { :type => 'Supports', :count => params[:supports].to_i } if params[:supports].present?
        @issues << { :type => 'Requirements', :count => params[:requirements].to_i } if params[:requirements].present?
        @issues << { :type => 'Features', :count => params[:features].to_i } if params[:features].present?
        @issues << { :type => 'User stories', :count => params[:user_stories].to_i } if params[:user_stories].present?
        @issues << { :type => 'Bugs', :count => params[:bugs].to_i } if params[:bugs].present?
        @issues << { :type => 'Tasks', :count => params[:tasks].to_i } if params[:tasks].present?

        # calculate total working days
        total_working_days = 1
        date = @ending_date
        while date > @starting_date
          total_working_days = total_working_days + 1 unless date.saturday? || date.sunday? || national_holidays.include?(date)
          date = date - 1.day
        end

        days_off_array = []
        (0...@members.size).each do |value|
          if params[:"member_#{value}"].present?
            days = params[:"member_#{value}"].lines.map(&:chomp)

            days.each do |day_off|
              day_off_date = Date.parse(day_off)
              days_off_array << { :name => @members[value], :day => day_off_date } unless day_off_date.saturday? || day_off_date.sunday? || national_holidays.include?(day_off_date)
            end
          end
        end

        grouped_days_off_per_day = days_off_array.group_by { |day_off| day_off[:day] }.map { |k,v| { :day => k, :count => v.size } }

        @total_crew_literals = ["#{@members.size}/#{@members.size} for #{total_working_days - grouped_days_off_per_day.size } days"]

        # For each day that someone might be missing note down how many team members will be here ####
        total_days_off = 0
        grouped_days_off_per_day.each do |day_off|
          @total_crew_literals << "#{ @members.size - day_off[:count]}/#{@members.size} on #{day_off[:day].strftime("%A %d/%m/%Y")}"
          total_days_off = total_days_off + day_off[:count]
        end

        @total_working_man_days = (total_working_days * @members.size ) - total_days_off
        @estimated_focus_factor = params[:focus_factor].present? ? params[:focus_factor].to_f : 1
        @estimated_velocity = (@total_working_man_days * @estimated_focus_factor )

        #### Days off during sprint ####
        grouped_days_off_per_person = days_off_array.group_by { |day_off| day_off[:name] }.map { |k,v| { :name => k, :count => v.size } }
        @total_days_off_literals = []
        grouped_days_off_per_person.each do |day_off|
          @total_days_off_literals << "#{day_off[:count] } days off for #{day_off[:name]}"
        end
      end
    end
  end

  def rails_logs_visualizer
    data = { :nodes => [], :edges => [] }

    if params[:full_text].present?
      index = 0
      g = GraphViz::new( :G, :type => :digraph )
      g[:rankdir] ='LR'

      params[:full_text].split('Started ').each do |action|
        if action.present? && action != ""
          action_parsed = /(?<action>.*) for/.match(action)[1]
          rendered_partials = []
          service_requests = []
          service_times = []
          compiled_assets = []
          sql_insertions = []
          sql_selections = []

          unless /.*\"\/assets.*/.match(action_parsed)
            action.split("\r\n").each do |log_line|
              partial_in_line = /Rendered (?<partial>(\S)*) \((?<time>(\S)*)ms/.match(log_line)
              service_request_in_line = /\[httplog\] Sending: (?<service>.*)/.match(log_line)
              service_time_in_line = /\[httplog\] Benchmark: (?<time>\S*)/.match(log_line)
              compiled_asset_in_line = /Compiled (?<asset>(\S)*)/.match(log_line)
              sql_insertion_in_line = /SQL.* INSERT INTO (?<table>(\S)*)/.match(log_line)
              sql_select_in_line = /SELECT .* FROM (?<table>(\S)*)/.match(log_line)

              if partial_in_line.present? && params[:rendered_partials] == 'true'
                rendered_partials << { :partial => partial_in_line[:partial], :time => partial_in_line[:time].to_f }
              end

              if service_time_in_line.present? && params[:service_requests] == 'true'
                service_times << service_time_in_line[:time].to_f
              end

              if service_request_in_line.present? && params[:service_requests] == 'true'
                service_requests << service_request_in_line[:service]
              end

              if compiled_asset_in_line.present? && params[:compiled_assets] == 'true'
                compiled_assets << compiled_asset_in_line[:asset]
              end

              if sql_insertion_in_line.present? && params[:sql_visualization] == 'true'
                sql_insertions << sql_insertion_in_line[:table]
              end

              if sql_select_in_line.present? && params[:sql_visualization] == 'true'
                sql_selections << sql_select_in_line[:table]
              end
            end

            controller_processing_request = /Processing by (?<controller>.*) as/.match(action)[1]

            if data[:nodes].size > 0 && (data[:nodes].map { |node| node[:label] }.include? action_parsed)
              data[:nodes].map { |node| node[:size] += 1 if node[:label] == action_parsed }
            else
              services = []

              service_requests.each_with_index do |service, index|
                services << { :service => service, :time => service_times[index] }
              end

              data[:nodes] << {
                  :id => "action#{index}",
                  :label => action_parsed,
                  :controller => controller_processing_request,
                  :rendered_partials => rendered_partials.group_by { |x| x[:partial] },
                  :service_requests => services,
                  :compiled_assets => compiled_assets.group_by { |x| x },
                  :sql_insertions => sql_insertions.group_by { |x| x },
                  :sql_selections => sql_selections.group_by { |x| x },
                  :size => 1
              }

              index = index + 1
            end
          end
        end
      end

      if data[:nodes].present?
        data[:nodes].each do |node|
          node[:graph_node] = g.add_nodes(node[:label], :label => "<<b>#{node[:label].gsub('&', '%26')}</b><br/><i>#{node[:controller]}</i>>")

          node[:rendered_partials].each do |partial, partials_array|
            partial_node = g.add_nodes(partial, :shape => :component)

            g.add_edges( node[:graph_node], partial_node, :label => "<<i>Renders<br/>(#{partials_array.size} times)<br/>in #{partials_array.inject(0){|sum,x| sum + x[:time] }.round(2)}ms</i>>")
          end

          node[:compiled_assets].each do |asset, assets_array|
            asset_node = g.add_nodes(asset, :shape => :folder)

            g.add_edges( node[:graph_node], asset_node, :label => "<<i>Compiles asset<br/>(#{assets_array.size} times)</i>>")
          end

          node[:sql_insertions].each do |array_name, names_array|
            array_node = g.add_nodes(array_name, :shape => :box3d)

            g.add_edges( node[:graph_node], array_node, :label => "<<i>Inserts into<br/>(#{names_array.size} times)</i>>")
          end

          node[:sql_selections].each do |array_name, names_array|
            array_node = g.add_nodes(array_name, :shape => :box3d)

            g.add_edges( node[:graph_node], array_node, :label => "<<i>Selects from<br/>(#{names_array.size} times)</i>>")
          end

          node[:service_requests].
              map { |service| {:service => URI(service[:service].split(' ')[1]).host, :time => service[:time]} }.
              group_by { |x| x[:service] }.
              each do |service, services_array|

            service_node = g.add_nodes(service, :shape => :note)
            g.add_edges( node[:graph_node], service_node, :label => "<<i>Requests<br/>(#{services_array.size} times)<br/>in #{(services_array.inject(0){|sum,x| sum + x[:time] } * 1000).round(2)}ms</i>>")
          end

          node[:service_requests].group_by { |x| x[:service] }.each do |service, services_array|
            service_split = service.split(' ')
            full_service_node = g.add_nodes("#{service_split[0]} #{[URI(service.split(' ')[1]).path, URI(service.split(' ')[1]).query.presence].reject { |x| x.blank? }.join('?')}", :shape => :note)

            g.add_edges( URI(service.split(' ')[1]).host, full_service_node, :label => "<<i>Includes requests to<br/>(#{services_array.size} times)<br/>in #{(services_array.inject(0){|sum,x| sum + x[:time] } * 1000).round(2)}ms</i>>")
          end
        end

        directory_name = "#{Rails.root}/app/assets/images/graphs/#{DateTime.now.strftime('%Y-%m-%d')}"
        FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)
        g.output(:png => "#{directory_name}/#{params[:graph_name].present? ? params[:graph_name] : "graph_#{DateTime.now.strftime('%H%M%S%L')}" }.png" )
      end
    end

    @images = Dir.glob("app/assets/images/graphs/*/*.png")
    @graph_name = "graph_#{DateTime.now.strftime('%H%M%S%L')}"
  end
end
