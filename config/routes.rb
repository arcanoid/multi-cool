Rails.application.routes.draw do
  root 'home#index'

  resource :tools, :only => [] do
    get :url_decoding_tool
    post :url_decoding_tool
    get :hash_generator
    post :hash_generator
    get :base64_encoder
    post :base64_encoder
    get :json_beautifier
    post :json_beautifier
    get :xml_beautifier
    post :xml_beautifier
    get :sql_beautifier
    post :sql_beautifier
  end

  resource :utilities, :only => [] do
    get :screenshot_snapper
    post :screenshot_snapper
    get :qr_code_producer
    post :qr_code_producer
    get :credit_card_validator
    post :credit_card_validator
  end

  resource :data_generation, :only => [] do
    get :sample_data
  end

  resource :conversions, :only => [] do
    get :length_conversion
    post :length_conversion
    get :weight_conversion
    post :weight_conversion
    get :time_conversion
    post :time_conversion
    get :area_conversion
    post :area_conversion
    get :volume_conversion
    post :volume_conversion
    get :speed_conversion
    post :speed_conversion
    get :temperature_conversion
    post :temperature_conversion
    get :pressure_conversion
    post :pressure_conversion
    get :energy_conversion
    post :energy_conversion
    get :power_conversion
    post :power_conversion
    get :magnetism_conversion
    post :magnetism_conversion
    get :radiation_conversion
    post :radiation_conversion
  end

  resource :format_conversions, :only => [] do
    get :xml_to_json
    post :xml_to_json
    get :json_to_xml
    post :json_to_xml
  end
end
