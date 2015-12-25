require 'rails_helper'

describe '/format_conversions' do
  it 'GET /format_conversions/xml_to_json it should route to format_conversions#xml_to_json' do
    { :get => '/format_conversions/xml_to_json' }.
        should route_to( :controller => 'format_conversions',
                         :action => 'xml_to_json')
  end

  it 'POST /format_conversions/xml_to_json it should route to format_conversions#xml_to_json' do
    { :post => '/format_conversions/xml_to_json' }.
        should route_to( :controller => 'format_conversions',
                         :action => 'xml_to_json')
  end

  it 'GET /format_conversions/json_to_xml it should route to format_conversions#json_to_xml' do
    { :get => '/format_conversions/json_to_xml' }.
        should route_to( :controller => 'format_conversions',
                         :action => 'json_to_xml')
  end

  it 'POST /format_conversions/json_to_xml it should route to format_conversions#json_to_xml' do
    { :post => '/format_conversions/json_to_xml' }.
        should route_to( :controller => 'format_conversions',
                         :action => 'json_to_xml')
  end
end