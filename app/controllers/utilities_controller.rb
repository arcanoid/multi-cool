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

  def qr_code_producer
    if params[:full_text].present?
      urls = params[:full_text].split(/\r\n/)

      urls.each do |url|
        directory_name = "#{Rails.root}/app/assets/images/qr_codes/#{DateTime.now.strftime('%Y_%m_%d')}"
        FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)

        full_file_name = "#{directory_name}/#{url.gsub('.', '').gsub('http://', '').gsub('/', '_').gsub(/\W/, '')}.png"

        qrcode = RQRCode::QRCode.new(url)

        qrcode.as_png(
            resize_gte_to: false,
            resize_exactly_to: false,
            fill: 'white',
            color: 'black',
            size: (params[:size].present? ? params[:size].to_i : 200),
            border_modules: 4,
            module_px_size: 6,
            file: full_file_name
        )
      end
    end

    @images = Dir.glob("app/assets/images/qr_codes/*/*.png")
  end
end