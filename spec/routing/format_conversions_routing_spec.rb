require 'rails_helper'

describe 'format_conversions routes', :type => :routing do
  it "GET /format_conversions/xml_to_json should route to 'format_conversions#xml_to_json'" do
    expect(:get => '/format_conversions/xml_to_json').
        to route_to(:controller => 'format_conversions',
                    :action => 'xml_to_json')
  end

  it "POST /format_conversions/xml_to_json should route to 'format_conversions#xml_to_json'" do
    expect(:post => '/format_conversions/xml_to_json').
        to route_to(:controller => 'format_conversions',
                    :action => 'xml_to_json')
  end

  it "GET /format_conversions/json_to_xml should route to 'format_conversions#json_to_xml'" do
    expect(:get => '/format_conversions/json_to_xml').
        to route_to(:controller => 'format_conversions',
                    :action => 'json_to_xml')
  end

  it "POST /format_conversions/json_to_xml should route to 'format_conversions#json_to_xml'" do
    expect(:post => '/format_conversions/json_to_xml').
        to route_to(:controller => 'format_conversions',
                    :action => 'json_to_xml')
  end

  it "GET /format_conversions/hash_to_json should route to 'format_conversions#hash_to_json'" do
    expect(:get => '/format_conversions/hash_to_json').
        to route_to(:controller => 'format_conversions',
                    :action => 'hash_to_json')
  end

  it "POST /format_conversions/hash_to_json should route to 'format_conversions#hash_to_json'" do
    expect(:post => '/format_conversions/hash_to_json').
        to route_to(:controller => 'format_conversions',
                    :action => 'hash_to_json')
  end

  it "GET /format_conversions/json_to_hash should route to 'format_conversions#json_to_hash'" do
    expect(:get => '/format_conversions/json_to_hash').
        to route_to(:controller => 'format_conversions',
                    :action => 'json_to_hash')
  end

  it "POST /format_conversions/json_to_hash should route to 'format_conversions#json_to_hash'" do
    expect(:post => '/format_conversions/json_to_hash').
        to route_to(:controller => 'format_conversions',
                    :action => 'json_to_hash')
  end
end
