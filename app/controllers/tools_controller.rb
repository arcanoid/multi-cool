class ToolsController < ApplicationController
  def url_decoding_tool
    @final_text = ''

    if params[:full_text].present?
      @final_text = case params[:type]
                      when 'encode' then ERB::Util.url_encode(params[:full_text])
                      when 'decode' then URI.decode(params[:full_text])
                      else params[:full_text]
                    end
    end
  end
end