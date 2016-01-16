require 'rails_helper'

describe '/web_resources' do
  it 'GET /web_resources/uri_parser it should route to web_resources#uri_parser' do
    { :get => '/web_resources/uri_parser' }.
        should route_to( :controller => 'web_resources',
                         :action => 'uri_parser')
  end

  it 'POST /web_resources/uri_parser it should route to web_resources#uri_parser' do
    { :post => '/web_resources/uri_parser' }.
        should route_to( :controller => 'web_resources',
                         :action => 'uri_parser')
  end

  it 'GET /web_resources/countries it should route to web_resources#countries' do
    { :get => '/web_resources/countries' }.
        should route_to( :controller => 'web_resources',
                         :action => 'countries')
  end

  it 'POST /web_resources/countries it should route to web_resources#countries' do
    { :post => '/web_resources/countries' }.
        should route_to( :controller => 'web_resources',
                         :action => 'countries')
  end
end