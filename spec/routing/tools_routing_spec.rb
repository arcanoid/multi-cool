require 'rails_helper'

describe 'tools routes' do
  it "GET /tools/url_decoding_tool should route to 'tools#url_decoding_tool'" do
    expect(:get => '/tools/url_decoding_tool').
      to route_to(:controller => 'tools',
          :action => 'url_decoding_tool')
  end

  it "POST /tools/url_decoding_tool should route to 'tools#url_decoding_tool'" do
    expect(:post => '/tools/url_decoding_tool').
      to route_to(:controller => 'tools',
          :action => 'url_decoding_tool')
  end

  it "GET /tools/hash_generator should route to 'tools#hash_generator'" do
    expect(:get => '/tools/hash_generator').
      to route_to(:controller => 'tools',
          :action => 'hash_generator')
  end

  it "POST /tools/hash_generator should route to 'tools#hash_generator'" do
    expect(:post => '/tools/hash_generator').
      to route_to(:controller => 'tools',
          :action => 'hash_generator')
  end

  it "GET /tools/base64_encoder should route to 'tools#base64_encoder'" do
    expect(:get => '/tools/base64_encoder').
      to route_to(:controller => 'tools',
          :action => 'base64_encoder')
  end

  it "POST /tools/base64_encoder should route to 'tools#base64_encoder'" do
    expect(:post => '/tools/base64_encoder').
      to route_to(:controller => 'tools',
          :action => 'base64_encoder')
  end

  it "GET /tools/json_beautifier should route to 'tools#json_beautifier'" do
    expect(:get => '/tools/json_beautifier').
      to route_to(:controller => 'tools',
          :action => 'json_beautifier')
  end

  it "POST /tools/json_beautifier should route to 'tools#json_beautifier'" do
    expect(:post => '/tools/json_beautifier').
      to route_to(:controller => 'tools',
          :action => 'json_beautifier')
  end

  it "GET /tools/json_to_ruby_class should route to 'tools#json_to_ruby_class'" do
    expect(:get => '/tools/json_to_ruby_class').
      to route_to(:controller => 'tools',
          :action => 'json_to_ruby_class')
  end

  it "POST /tools/json_to_ruby_class should route to 'tools#json_to_ruby_class'" do
    expect(:post => '/tools/json_to_ruby_class').
      to route_to(:controller => 'tools',
          :action => 'json_to_ruby_class')
  end

  it "GET /tools/xml_beautifier should route to 'tools#xml_beautifier'" do
    expect(:get => '/tools/xml_beautifier').
      to route_to(:controller => 'tools',
          :action => 'xml_beautifier')
  end

  it "POST /tools/xml_beautifier should route to 'tools#xml_beautifier'" do
    expect(:post => '/tools/xml_beautifier').
      to route_to(:controller => 'tools',
          :action => 'xml_beautifier')
  end

  it "GET /tools/sql_beautifier should route to 'tools#sql_beautifier'" do
    expect(:get => '/tools/sql_beautifier').
      to route_to(:controller => 'tools',
          :action => 'sql_beautifier')
  end

  it "POST /tools/sql_beautifier should route to 'tools#sql_beautifier'" do
    expect(:post => '/tools/sql_beautifier').
      to route_to(:controller => 'tools',
          :action => 'sql_beautifier')
  end

  it "GET /tools/ssh_generator should route to 'tools#ssh_generator'" do
    expect(:get => '/tools/ssh_generator').
      to route_to(:controller => 'tools',
          :action => 'ssh_generator')
  end

  it "POST /tools/ssh_generator should route to 'tools#ssh_generator'" do
    expect(:post => '/tools/ssh_generator').
      to route_to(:controller => 'tools',
          :action => 'ssh_generator')
  end

  it "GET /tools/text_analysis should route to 'tools#text_analysis'" do
    expect(:get => '/tools/text_analysis').
      to route_to(:controller => 'tools',
          :action => 'text_analysis')
  end

  it "POST /tools/text_analysis should route to 'tools#text_analysis'" do
    expect(:post => '/tools/text_analysis').
      to route_to(:controller => 'tools',
          :action => 'text_analysis')
  end

end