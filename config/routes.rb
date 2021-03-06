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
    get :json_to_ruby_class
    post :json_to_ruby_class
    get :xml_beautifier
    post :xml_beautifier
    get :sql_beautifier
    post :sql_beautifier
    get :ssh_generator
    post :ssh_generator
    get :text_analysis
    post :text_analysis
    get :text_replacement
    post :text_replacement
    get :json_web_token
    post :json_web_token
  end

  resource :utilities, :only => [] do
    get :screenshot_snapper
    post :screenshot_snapper
    get :qr_code_producer
    post :qr_code_producer
    get :credit_card_validator
    post :credit_card_validator
    get :rss_feed_validator
    post :rss_feed_validator
    get :html_validator
    post :html_validator
    get :sprint_calculator
    post :sprint_calculator
    get :rails_logs_visualizer
    post :rails_logs_visualizer
    get :gem_dependencies_visualizer
    post :gem_dependencies_visualizer
  end

  resource :data_generation, :only => [] do
    get :sample_data
    get :geographical_sample_data
    get :monetary_sample_data
    get :internet_sample_data
    get :commerce_and_contact_sample_data
    get :date_and_time_sample_data
    get :text_sample_data
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
  end

  resource :format_conversions, :only => [] do
    get :xml_to_json
    post :xml_to_json
    get :json_to_xml
    post :json_to_xml
    get :hash_to_json
    post :hash_to_json
    get :json_to_hash
    post :json_to_hash
  end

  resource :web_resources, :only => [] do
    get :uri_parser
    post :uri_parser
    get :countries
    post :countries
    get '/countries/:id', to: 'web_resources#country'
    get :json_comparer
    post :json_comparer
    get :date_diff
    post :date_diff
    get :user_agent_identifier
    post :user_agent_identifier
    get :user_agent_info
    post :user_agent_info
  end
end
