class WebResourcesController < ApplicationController
  def uri_parser
    if params[:uri]
      @uri = URI(params[:uri])
    end
  end
end