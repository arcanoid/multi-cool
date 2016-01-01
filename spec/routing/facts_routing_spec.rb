require 'rails_helper'

describe '/facts' do
  it 'GET /facts/random_facts it should route to facts#random_facts' do
    { :get => '/facts/random_facts' }.
        should route_to( :controller => 'facts',
                         :action => 'random_facts')
  end

  it 'GET /facts/this_day_in_history it should route to facts#this_day_in_history' do
    { :get => '/facts/this_day_in_history' }.
        should route_to( :controller => 'facts',
                         :action => 'this_day_in_history')
  end
end
