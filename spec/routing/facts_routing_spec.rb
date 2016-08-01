require 'rails_helper'

describe 'facts routes' do
  it "GET /facts/random_facts should route to 'facts#random_facts'" do
    expect(:get => '/facts/random_facts').
      to route_to(:controller => 'facts',
          :action => 'random_facts')
  end

  it "GET /facts/this_day_in_history should route to 'facts#this_day_in_history'" do
    expect(:get => '/facts/this_day_in_history').
      to route_to(:controller => 'facts',
          :action => 'this_day_in_history')
  end

end