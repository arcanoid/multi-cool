require 'rails_helper'

describe 'utilities routes' do
  it "GET /utilities/screenshot_snapper should route to 'utilities#screenshot_snapper'" do
    expect(:get => '/utilities/screenshot_snapper').
      to route_to(:controller => 'utilities',
          :action => 'screenshot_snapper')
  end

  it "POST /utilities/screenshot_snapper should route to 'utilities#screenshot_snapper'" do
    expect(:post => '/utilities/screenshot_snapper').
      to route_to(:controller => 'utilities',
          :action => 'screenshot_snapper')
  end

  it "GET /utilities/qr_code_producer should route to 'utilities#qr_code_producer'" do
    expect(:get => '/utilities/qr_code_producer').
      to route_to(:controller => 'utilities',
          :action => 'qr_code_producer')
  end

  it "POST /utilities/qr_code_producer should route to 'utilities#qr_code_producer'" do
    expect(:post => '/utilities/qr_code_producer').
      to route_to(:controller => 'utilities',
          :action => 'qr_code_producer')
  end

  it "GET /utilities/credit_card_validator should route to 'utilities#credit_card_validator'" do
    expect(:get => '/utilities/credit_card_validator').
      to route_to(:controller => 'utilities',
          :action => 'credit_card_validator')
  end

  it "POST /utilities/credit_card_validator should route to 'utilities#credit_card_validator'" do
    expect(:post => '/utilities/credit_card_validator').
      to route_to(:controller => 'utilities',
          :action => 'credit_card_validator')
  end

  it "GET /utilities/rss_feed_validator should route to 'utilities#rss_feed_validator'" do
    expect(:get => '/utilities/rss_feed_validator').
      to route_to(:controller => 'utilities',
          :action => 'rss_feed_validator')
  end

  it "POST /utilities/rss_feed_validator should route to 'utilities#rss_feed_validator'" do
    expect(:post => '/utilities/rss_feed_validator').
      to route_to(:controller => 'utilities',
          :action => 'rss_feed_validator')
  end

  it "GET /utilities/sprint_calculator should route to 'utilities#sprint_calculator'" do
    expect(:get => '/utilities/sprint_calculator').
      to route_to(:controller => 'utilities',
          :action => 'sprint_calculator')
  end

  it "POST /utilities/sprint_calculator should route to 'utilities#sprint_calculator'" do
    expect(:post => '/utilities/sprint_calculator').
      to route_to(:controller => 'utilities',
          :action => 'sprint_calculator')
  end

  it "GET /utilities/rails_logs_visualizer should route to 'utilities#rails_logs_visualizer'" do
    expect(:get => '/utilities/rails_logs_visualizer').
      to route_to(:controller => 'utilities',
          :action => 'rails_logs_visualizer')
  end

  it "POST /utilities/rails_logs_visualizer should route to 'utilities#rails_logs_visualizer'" do
    expect(:post => '/utilities/rails_logs_visualizer').
      to route_to(:controller => 'utilities',
          :action => 'rails_logs_visualizer')
  end

end