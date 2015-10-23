class UtilitiesController < ApplicationController
  def credit_card_validator
    return unless params[:cc_number].present?

    @verdict = check_card(params[:cc_number])
  end

  def screenshot_snapper
    if params[:full_text].present?
      driver = Selenium::WebDriver.for :firefox

      urls = params[:full_text].split(/\r\n/)

      urls.each do |url|

        if url.present?
          directory_name = "#{Rails.root}/app/assets/images/screens/#{DateTime.now.strftime('%Y_%m_%d')}"
          FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)

          full_file_name = "#{directory_name}/#{url.gsub('.', '').gsub('http://', '').gsub('/', '_').gsub(/\W/, '')}.png"

          driver.get url
          driver.save_screenshot full_file_name
        end
      end

      driver.quit
    end

    @images = Dir.glob("app/assets/images/screens/*/*.png")
  end

  #########
  protected
  #########

  # From http://stackoverflow.com/questions/19011969/luhn-algorithm-returning-true-for-a-false-credit-card
  def check_card(str)
    c_num = []

    sum = 0

    s_numbers = str.split("").map(&:to_i)
    checksum = s_numbers.pop #chop off last digit, store as checksum

    s_numbers.each_slice(2) do |x|
      c_num << (x.last * 2)
      c_num << (x.first)
    end

    c_num.each do |num|
      if num.to_i > 9
        sum+= (num % 10) + 1
      else
        sum += num
      end
    end

    (sum * 9) % 10 == checksum
  end
end