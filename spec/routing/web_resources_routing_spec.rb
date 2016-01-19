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

  it 'GET /web_resources/json_comparer it should route to web_resources#json_comparer' do
    { :get => '/web_resources/json_comparer' }.
        should route_to( :controller => 'web_resources',
                         :action => 'json_comparer')
  end

  it 'POST /web_resources/json_comparer it should route to web_resources#json_comparer' do
    { :post => '/web_resources/json_comparer' }.
        should route_to( :controller => 'web_resources',
                         :action => 'json_comparer')
  end

  it 'GET /web_resources/user_agent_identifier it should route to web_resources#user_agent_identifier' do
    { :get => '/web_resources/user_agent_identifier' }.
        should route_to( :controller => 'web_resources',
                         :action => 'user_agent_identifier')
  end

  it 'POST /web_resources/user_agent_identifier it should route to web_resources#user_agent_identifier' do
    { :post => '/web_resources/user_agent_identifier' }.
        should route_to( :controller => 'web_resources',
                         :action => 'user_agent_identifier')
  end

  it 'GET /web_resources/user_agent_info it should route to web_resources#user_agent_info' do
    { :get => '/web_resources/user_agent_info' }.
        should route_to( :controller => 'web_resources',
                         :action => 'user_agent_info')
  end

  it 'POST /web_resources/user_agent_info it should route to web_resources#user_agent_info' do
    { :post => '/web_resources/user_agent_info' }.
        should route_to( :controller => 'web_resources',
                         :action => 'user_agent_info')
  end
end