Rails.application.routes.draw do
  root 'home#index'

  resource :tools, :only => [] do
    get :url_decoding_tool
    post :url_decoding_tool
    get :screenshot_snapper
    post :screenshot_snapper
  end
end
