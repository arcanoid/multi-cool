require 'rails_helper'

describe '/tools' do
  it 'GET /tools/url_decoding_tool it should route to tools#url_decoding_tool' do
    { :get => '/tools/url_decoding_tool' }.
        should route_to( :controller => 'tools',
                         :action => 'url_decoding_tool')
  end

  it 'POST /tools/url_decoding_tool it should route to tools#url_decoding_tool' do
    { :post => '/tools/url_decoding_tool' }.
        should route_to( :controller => 'tools',
                         :action => 'url_decoding_tool')
  end

  it 'GET /tools/hash_generator it should route to tools#hash_generator' do
    { :get => '/tools/hash_generator' }.
        should route_to( :controller => 'tools',
                         :action => 'hash_generator')
  end

  it 'POST /tools/hash_generator it should route to tools#hash_generator' do
    { :post => '/tools/hash_generator' }.
        should route_to( :controller => 'tools',
                         :action => 'hash_generator')
  end

  it 'GET /tools/base64_encoder it should route to tools#base64_encoder' do
    { :get => '/tools/base64_encoder' }.
        should route_to( :controller => 'tools',
                         :action => 'base64_encoder')
  end

  it 'POST /tools/base64_encoder it should route to tools#base64_encoder' do
    { :post => '/tools/base64_encoder' }.
        should route_to( :controller => 'tools',
                         :action => 'base64_encoder')
  end

  it 'GET /tools/json_beautifier it should route to tools#json_beautifier' do
    { :get => '/tools/json_beautifier' }.
        should route_to( :controller => 'tools',
                         :action => 'json_beautifier')
  end

  it 'POST /tools/json_beautifier it should route to tools#json_beautifier' do
    { :post => '/tools/json_beautifier' }.
        should route_to( :controller => 'tools',
                         :action => 'json_beautifier')
  end

  it 'GET /tools/xml_beautifier it should route to tools#xml_beautifier' do
    { :get => '/tools/xml_beautifier' }.
        should route_to( :controller => 'tools',
                         :action => 'xml_beautifier')
  end

  it 'POST /tools/xml_beautifier it should route to tools#xml_beautifier' do
    { :post => '/tools/xml_beautifier' }.
        should route_to( :controller => 'tools',
                         :action => 'xml_beautifier')
  end

  it 'GET /tools/sql_beautifier it should route to tools#sql_beautifier' do
    { :get => '/tools/sql_beautifier' }.
        should route_to( :controller => 'tools',
                         :action => 'sql_beautifier')
  end

  it 'POST /tools/sql_beautifier it should route to tools#sql_beautifier' do
    { :post => '/tools/sql_beautifier' }.
        should route_to( :controller => 'tools',
                         :action => 'sql_beautifier')
  end
end
