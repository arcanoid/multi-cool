require 'rails_helper'

describe 'data_generations routes', :type => :routing do
  it "GET /data_generation/sample_data should route to 'data_generations#sample_data'" do
    expect(:get => '/data_generation/sample_data').
        to route_to(:controller => 'data_generations',
                    :action => 'sample_data')
  end

  it "GET /data_generation/geographical_sample_data should route to 'data_generations#geographical_sample_data'" do
    expect(:get => '/data_generation/geographical_sample_data').
        to route_to(:controller => 'data_generations',
                    :action => 'geographical_sample_data')
  end

  it "GET /data_generation/monetary_sample_data should route to 'data_generations#monetary_sample_data'" do
    expect(:get => '/data_generation/monetary_sample_data').
        to route_to(:controller => 'data_generations',
                    :action => 'monetary_sample_data')
  end

  it "GET /data_generation/internet_sample_data should route to 'data_generations#internet_sample_data'" do
    expect(:get => '/data_generation/internet_sample_data').
        to route_to(:controller => 'data_generations',
                    :action => 'internet_sample_data')
  end

  it "GET /data_generation/commerce_and_contact_sample_data should route to 'data_generations#commerce_and_contact_sample_data'" do
    expect(:get => '/data_generation/commerce_and_contact_sample_data').
        to route_to(:controller => 'data_generations',
                    :action => 'commerce_and_contact_sample_data')
  end

  it "GET /data_generation/date_and_time_sample_data should route to 'data_generations#date_and_time_sample_data'" do
    expect(:get => '/data_generation/date_and_time_sample_data').
        to route_to(:controller => 'data_generations',
                    :action => 'date_and_time_sample_data')
  end

  it "GET /data_generation/text_sample_data should route to 'data_generations#text_sample_data'" do
    expect(:get => '/data_generation/text_sample_data').
        to route_to(:controller => 'data_generations',
                    :action => 'text_sample_data')
  end
end
