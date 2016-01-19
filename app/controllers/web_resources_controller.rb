class WebResourcesController < ApplicationController
  def uri_parser
    if params[:uri]
      @uri = URI(params[:uri])
    end
  end

  def countries
    @all_countries = ISO3166::Country.all.sort_by { |country| country.name}

    if params[:id]
      @country = ISO3166::Country.new(params[:id])
    end
  end

  def json_comparer
    begin
      initial_text = params[:initial_text].present? ? params[:initial_text] : '{"desc": {"someKey": "someValue", "anotherKey" : "value"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'
      final_text = params[:final_text].present? ? params[:final_text] : '{"desc": {"someKey": "someOtherValue", "anotherKey" : "WithOthervalue"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'

      parsed_initial_text = JSON.parse(initial_text)
      parsed_final_text = JSON.parse(final_text)

      @initial_text = JSON.pretty_generate(parsed_initial_text)
      @final_text = JSON.pretty_generate(parsed_final_text)
      @result = JSON.pretty_generate(JsonCompare.get_diff(parsed_initial_text, parsed_final_text))
    rescue JSON::ParserError => e
      flash[:error] = 'Wrong format'
      @initial_text = JSON.pretty_generate(JSON.parse('{"desc": {"someKey": "someValue", "anotherKey" : "value"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'))
      @final_text = JSON.pretty_generate(JSON.parse('{"desc": {"someKey": "someOtherValue", "anotherKey" : "WithOthervalue"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'))
    rescue Exception => e
      flash[:error] = 'An error occured please try again!'
      @initial_text = JSON.pretty_generate(JSON.parse('{"desc": {"someKey": "someValue", "anotherKey" : "value"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'))
      @final_text = JSON.pretty_generate(JSON.parse('{"desc": {"someKey": "someOtherValue", "anotherKey" : "WithOthervalue"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'))
    end
  end

  def date_diff
    begin
      @day_from = params[:day_from].present? ? params[:day_from] : Date.today.day
      @month_from = params[:month_from].present? ? params[:month_from] : Date.today.month
      @year_from = params[:year_from].present? ? params[:year_from] : Date.today.year
      @day_to = params[:day_to].present? ? params[:day_to] : (Date.today + 7.days).day
      @month_to = params[:month_to].present? ? params[:month_to] : (Date.today + 7.days).month
      @year_to = params[:year_to].present? ? params[:year_to] : (Date.today + 7.days).year

      date_from = DateTime.new(@year_from.to_i, @month_from.to_i, @day_from.to_i)
      date_to = DateTime.new(@year_to.to_i, @month_to.to_i, @day_to.to_i)

      @differences = { :seconds => TimeDifference.between(date_from, date_to).in_seconds.to_i,
                       :minutes => TimeDifference.between(date_from, date_to).in_minutes.to_i,
                       :hours => TimeDifference.between(date_from, date_to).in_hours.to_i,
                       :days => TimeDifference.between(date_from, date_to).in_days.to_i,
                       :weeks => TimeDifference.between(date_from, date_to).in_weeks,
                       :months => TimeDifference.between(date_from, date_to).in_months,
                       :years => TimeDifference.between(date_from, date_to).in_years }

    rescue Exception => e
      flash[:error] = e
    end
  end

  def user_agent_identifier
    begin
      user_agents_list = (params[:user_agents].present? ? params[:user_agents].lines.map(&:chomp) : [request.user_agent])

      @user_agents = []

      user_agents_list.each do |ua|
        @user_agents << Browser.new(:ua => ua, :accept_language => "en-us")
      end
    rescue Exception => e
      flash[:error] = e
    end
  end

  def user_agent_info
    begin
      @user_agent = Browser.new(:ua => (params[:user_agent].present? ? params[:user_agent] : request.user_agent), :accept_language => "en-us")
    rescue Exception => e
      flash[:error] = e
    end
  end
end