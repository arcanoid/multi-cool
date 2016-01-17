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
end