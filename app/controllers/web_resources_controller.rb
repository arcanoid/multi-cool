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
end