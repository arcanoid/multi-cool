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

  def screenshot_snapper
    require 'selenium-webdriver'

    if params[:full_text].present?
      driver = Selenium::WebDriver.for :firefox

      urls = params[:full_text].split(/\r\n/)

      urls.each do |url|

        if url.present?
          directory_name = "#{Rails.root}/app/assets/images/screens/#{DateTime.now.strftime('%Y_%m_%d')}"
          FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)

          full_file_name = "#{directory_name}/#{url.gsub('.', '').gsub('http://', '').gsub('/', '_').gsub('#', '').gsub(':', '')}.png"

          driver.get url
          driver.save_screenshot full_file_name
        end
      end

      driver.quit
    end

    @images = Dir.glob("app/assets/images/screens/*/*.png")
  end

  def base64_encoder
    @final_text = case params[:type]
                    when 'encode' then Base64.encode64(params[:full_text])
                    when 'decode' then Base64.decode64(params[:full_text])
                    else ''
                  end

  end
end