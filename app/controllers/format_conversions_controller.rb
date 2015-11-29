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
end