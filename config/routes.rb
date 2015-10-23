Rails.application.routes.draw do
  root 'home#index'

  resource :tools, :only => [] do
    get :url_decoding_tool
    post :url_decoding_tool
    get :screenshot_snapper
    post :screenshot_snapper
    get :hash_generator
    post :hash_generator
    get :base64_encoder
    post :base64_encoder
    get :json_beautifier
    post :json_beautifier
    get :xml_beautifier
    post :xml_beautifier
  end
end
