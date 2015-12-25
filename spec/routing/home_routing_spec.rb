require 'rails_helper'

describe '/' do
  it 'GET / it should route to home_controller#index' do
    { :get => '/' }.
        should route_to( :controller => 'home',
                         :action => 'index')
  end
end