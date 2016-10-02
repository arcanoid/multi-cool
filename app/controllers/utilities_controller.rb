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

          (params[:display_sizes] || ['1280x1024']).each do |display_size|
            full_file_name = "#{directory_name}/#{display_size}_#{url.gsub('.', '').gsub('http://', '').gsub('/', '_').gsub(/\W/, '').try(:slice, 0, 250)}.png"

            driver.manage.window.resize_to(*(display_size.split('x')))
            driver.get url
            driver.save_screenshot full_file_name
          end
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
    if params[:full_text].present?
      begin
        options = { :serializers => (params['serializers'] == 'true'),
                    :rendered_partials => (params['rendered_partials'] == 'true'),
                    :service_requests => (params['service_requests'] == 'true'),
                    :compiled_assets => (params['compiled_assets'] == 'true'),
                    :sql_visualization => (params['sql_visualization'] == 'true') }

        LogsVisualizer.produce_graph params[:full_text], params[:graph_name], options
      rescue Exception => e
        flash[:error] = e
      end
    end

    @images = Dir.glob("app/assets/images/graphs/*.png")
    @graph_name = "graph_#{DateTime.now.strftime('%H%M%S%L')}"
  end

  def gem_dependencies_visualizer
    if params[:full_text].present?
      begin
        GemDependenciesVisualizer.produce_gems_graph params[:full_text], params[:graph_name]
      rescue Exception => e
        flash[:error] = e
      end
    end

    @images = Dir.glob("app/assets/images/gem_dependencies_graphs/*.png")
    @graph_name = "graph_#{DateTime.now.strftime('%H%M%S%L')}"
  end
end
