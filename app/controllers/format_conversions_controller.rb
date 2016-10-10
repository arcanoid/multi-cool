class FormatConversionsController < ApplicationController
  def xml_to_json
    text = params[:initial_text].present? ?
        params[:initial_text] :
        "<note><to>Tove</to><from>Jani</from><heading>Reminder</heading><body>Don't forget me this weekend!</body></note>"

    begin
      @initial_text = text
      json = Hash.from_xml(@initial_text)
      @final_text = JSON.pretty_generate(JSON.parse(json.to_json))
    rescue JSON::ParserError => e
      flash[:error] = 'Wrong format'
    rescue Exception => e
      flash[:error] = 'An error occured please try again!'
    end
  end

  def json_to_xml
    text = params[:initial_text].present? ? params[:initial_text] : '{"desc": {"someKey": "someValue", "anotherKey" : "value"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'

    begin
      @initial_text = JSON.pretty_generate(JSON.parse(text))
      @final_text = JSON.parse(text).to_xml
    rescue JSON::ParserError => e
      flash[:error] = 'Wrong format'
    rescue Exception => e
      flash[:error] = 'An error occured please try again!'
    end
  end

  def json_to_hash
    text = params[:initial_text].present? ? params[:initial_text] : '{"desc": {"someKey": "someValue", "anotherKey" : "value"}, "main_item": {"stats": {"a": 8, "b": 12, "c": 10}}}'

    begin
      @initial_text = text
      @final_text = JSON.pretty_generate(JSON.parse(text)).gsub('": ', '" => ')
    rescue JSON::ParserError => e
      flash[:error] = 'Wrong format'
    rescue Exception => e
      flash[:error] = 'An error occured please try again!'
    end
  end

  def hash_to_json
    text = params[:initial_text].present? ? params[:initial_text] : '{"desc" => {"someKey" => "someValue", "anotherKey" => "value"}, "main_item" => {"stats" => {"a" => 8, "b" => 12, "c" => 10}}}'

    begin
      @initial_text = text
      @final_text = JSON.pretty_generate(JSON.parse(text.gsub('" => ', '": ').gsub('"=>', '":')))
    rescue JSON::ParserError => e
      flash[:error] = 'Wrong format'
    rescue Exception => e
      flash[:error] = 'An error occured please try again!'
    end
  end
end

