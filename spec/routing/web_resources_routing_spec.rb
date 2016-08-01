require 'rails_helper'

describe 'web_resources routes' do
  it "GET /web_resources/uri_parser should route to 'web_resources#uri_parser'" do
    expect(:get => '/web_resources/uri_parser').
      to route_to(:controller => 'web_resources',
          :action => 'uri_parser')
  end

  it "POST /web_resources/uri_parser should route to 'web_resources#uri_parser'" do
    expect(:post => '/web_resources/uri_parser').
      to route_to(:controller => 'web_resources',
          :action => 'uri_parser')
  end

  it "GET /web_resources/countries should route to 'web_resources#countries'" do
    expect(:get => '/web_resources/countries').
      to route_to(:controller => 'web_resources',
          :action => 'countries')
  end

  it "POST /web_resources/countries should route to 'web_resources#countries'" do
    expect(:post => '/web_resources/countries').
      to route_to(:controller => 'web_resources',
          :action => 'countries')
  end

  it "GET /web_resources/json_comparer should route to 'web_resources#json_comparer'" do
    expect(:get => '/web_resources/json_comparer').
      to route_to(:controller => 'web_resources',
          :action => 'json_comparer')
  end

  it "POST /web_resources/json_comparer should route to 'web_resources#json_comparer'" do
    expect(:post => '/web_resources/json_comparer').
      to route_to(:controller => 'web_resources',
          :action => 'json_comparer')
  end

  it "GET /web_resources/date_diff should route to 'web_resources#date_diff'" do
    expect(:get => '/web_resources/date_diff').
      to route_to(:controller => 'web_resources',
          :action => 'date_diff')
  end

  it "POST /web_resources/date_diff should route to 'web_resources#date_diff'" do
    expect(:post => '/web_resources/date_diff').
      to route_to(:controller => 'web_resources',
          :action => 'date_diff')
  end

  it "GET /web_resources/user_agent_identifier should route to 'web_resources#user_agent_identifier'" do
    expect(:get => '/web_resources/user_agent_identifier').
      to route_to(:controller => 'web_resources',
          :action => 'user_agent_identifier')
  end

  it "POST /web_resources/user_agent_identifier should route to 'web_resources#user_agent_identifier'" do
    expect(:post => '/web_resources/user_agent_identifier').
      to route_to(:controller => 'web_resources',
          :action => 'user_agent_identifier')
  end

  it "GET /web_resources/user_agent_info should route to 'web_resources#user_agent_info'" do
    expect(:get => '/web_resources/user_agent_info').
      to route_to(:controller => 'web_resources',
          :action => 'user_agent_info')
  end

  it "POST /web_resources/user_agent_info should route to 'web_resources#user_agent_info'" do
    expect(:post => '/web_resources/user_agent_info').
      to route_to(:controller => 'web_resources',
          :action => 'user_agent_info')
  end

end