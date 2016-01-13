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

          full_file_name = "#{directory_name}/#{url.gsub('.', '').gsub('http://', '').gsub('/', '_').gsub(/\W/, '')}.png"

          driver.get url
          driver.save_screenshot full_file_name
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
end
