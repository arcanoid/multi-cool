require 'rails_helper'

describe 'home routes' do
  it "GET / should route to 'home#index'" do
    expect(:get => '/').
      to route_to(:controller => 'home',
          :action => 'index')
  end

end