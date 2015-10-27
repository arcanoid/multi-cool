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
    get :credit_card_validator
    post :credit_card_validator
  end
end
