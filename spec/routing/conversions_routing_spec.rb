require 'rails_helper'

describe '/conversions' do
  it 'GET /conversions/length_conversion it should route to conversions#length_conversion' do
    { :get => '/conversions/length_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'length_conversion')
  end

  it 'POST /conversions/length_conversion it should route to conversions#length_conversion' do
    { :post => '/conversions/length_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'length_conversion')
  end

  it 'GET /conversions/weight_conversion it should route to conversions#weight_conversion' do
    { :get => '/conversions/weight_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'weight_conversion')
  end

  it 'POST /conversions/weight_conversion it should route to conversions#weight_conversion' do
    { :post => '/conversions/weight_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'weight_conversion')
  end

  it 'GET /conversions/time_conversion it should route to conversions#time_conversion' do
    { :get => '/conversions/time_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'time_conversion')
  end

  it 'POST /conversions/time_conversion it should route to conversions#time_conversion' do
    { :post => '/conversions/time_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'time_conversion')
  end

  it 'GET /conversions/area_conversion it should route to conversions#area_conversion' do
    { :get => '/conversions/area_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'area_conversion')
  end

  it 'POST /conversions/area_conversion it should route to conversions#area_conversion' do
    { :post => '/conversions/area_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'area_conversion')
  end

  it 'GET /conversions/volume_conversion it should route to conversions#volume_conversion' do
    { :get => '/conversions/volume_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'volume_conversion')
  end

  it 'POST /conversions/volume_conversion it should route to conversions#volume_conversion' do
    { :post => '/conversions/volume_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'volume_conversion')
  end

  it 'GET /conversions/speed_conversion it should route to conversions#speed_conversion' do
    { :get => '/conversions/speed_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'speed_conversion')
  end

  it 'POST /conversions/speed_conversion it should route to conversions#speed_conversion' do
    { :post => '/conversions/speed_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'speed_conversion')
  end

  it 'GET /conversions/temperature_conversion it should route to conversions#temperature_conversion' do
    { :get => '/conversions/temperature_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'temperature_conversion')
  end

  it 'POST /conversions/temperature_conversion it should route to conversions#temperature_conversion' do
    { :post => '/conversions/temperature_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'temperature_conversion')
  end

  it 'GET /conversions/pressure_conversion it should route to conversions#pressure_conversion' do
    { :get => '/conversions/pressure_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'pressure_conversion')
  end

  it 'POST /conversions/pressure_conversion it should route to conversions#pressure_conversion' do
    { :post => '/conversions/pressure_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'pressure_conversion')
  end

  it 'GET /conversions/energy_conversion it should route to conversions#energy_conversion' do
    { :get => '/conversions/energy_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'energy_conversion')
  end

  it 'POST /conversions/energy_conversion it should route to conversions#energy_conversion' do
    { :post => '/conversions/energy_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'energy_conversion')
  end

  it 'GET /conversions/power_conversion it should route to conversions#power_conversion' do
    { :get => '/conversions/power_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'power_conversion')
  end

  it 'POST /conversions/power_conversion it should route to conversions#power_conversion' do
    { :post => '/conversions/power_conversion' }.
        should route_to( :controller => 'conversions',
                         :action => 'power_conversion')
  end
end