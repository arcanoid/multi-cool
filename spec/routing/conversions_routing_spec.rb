require 'rails_helper'

describe 'conversions routes' do
  it "GET /conversions/length_conversion should route to 'conversions#length_conversion'" do
    expect(:get => '/conversions/length_conversion').
      to route_to(:controller => 'conversions',
          :action => 'length_conversion')
  end

  it "POST /conversions/length_conversion should route to 'conversions#length_conversion'" do
    expect(:post => '/conversions/length_conversion').
      to route_to(:controller => 'conversions',
          :action => 'length_conversion')
  end

  it "GET /conversions/weight_conversion should route to 'conversions#weight_conversion'" do
    expect(:get => '/conversions/weight_conversion').
      to route_to(:controller => 'conversions',
          :action => 'weight_conversion')
  end

  it "POST /conversions/weight_conversion should route to 'conversions#weight_conversion'" do
    expect(:post => '/conversions/weight_conversion').
      to route_to(:controller => 'conversions',
          :action => 'weight_conversion')
  end

  it "GET /conversions/time_conversion should route to 'conversions#time_conversion'" do
    expect(:get => '/conversions/time_conversion').
      to route_to(:controller => 'conversions',
          :action => 'time_conversion')
  end

  it "POST /conversions/time_conversion should route to 'conversions#time_conversion'" do
    expect(:post => '/conversions/time_conversion').
      to route_to(:controller => 'conversions',
          :action => 'time_conversion')
  end

  it "GET /conversions/area_conversion should route to 'conversions#area_conversion'" do
    expect(:get => '/conversions/area_conversion').
      to route_to(:controller => 'conversions',
          :action => 'area_conversion')
  end

  it "POST /conversions/area_conversion should route to 'conversions#area_conversion'" do
    expect(:post => '/conversions/area_conversion').
      to route_to(:controller => 'conversions',
          :action => 'area_conversion')
  end

  it "GET /conversions/volume_conversion should route to 'conversions#volume_conversion'" do
    expect(:get => '/conversions/volume_conversion').
      to route_to(:controller => 'conversions',
          :action => 'volume_conversion')
  end

  it "POST /conversions/volume_conversion should route to 'conversions#volume_conversion'" do
    expect(:post => '/conversions/volume_conversion').
      to route_to(:controller => 'conversions',
          :action => 'volume_conversion')
  end

  it "GET /conversions/speed_conversion should route to 'conversions#speed_conversion'" do
    expect(:get => '/conversions/speed_conversion').
      to route_to(:controller => 'conversions',
          :action => 'speed_conversion')
  end

  it "POST /conversions/speed_conversion should route to 'conversions#speed_conversion'" do
    expect(:post => '/conversions/speed_conversion').
      to route_to(:controller => 'conversions',
          :action => 'speed_conversion')
  end

  it "GET /conversions/temperature_conversion should route to 'conversions#temperature_conversion'" do
    expect(:get => '/conversions/temperature_conversion').
      to route_to(:controller => 'conversions',
          :action => 'temperature_conversion')
  end

  it "POST /conversions/temperature_conversion should route to 'conversions#temperature_conversion'" do
    expect(:post => '/conversions/temperature_conversion').
      to route_to(:controller => 'conversions',
          :action => 'temperature_conversion')
  end

  it "GET /conversions/pressure_conversion should route to 'conversions#pressure_conversion'" do
    expect(:get => '/conversions/pressure_conversion').
      to route_to(:controller => 'conversions',
          :action => 'pressure_conversion')
  end

  it "POST /conversions/pressure_conversion should route to 'conversions#pressure_conversion'" do
    expect(:post => '/conversions/pressure_conversion').
      to route_to(:controller => 'conversions',
          :action => 'pressure_conversion')
  end

  it "GET /conversions/energy_conversion should route to 'conversions#energy_conversion'" do
    expect(:get => '/conversions/energy_conversion').
      to route_to(:controller => 'conversions',
          :action => 'energy_conversion')
  end

  it "POST /conversions/energy_conversion should route to 'conversions#energy_conversion'" do
    expect(:post => '/conversions/energy_conversion').
      to route_to(:controller => 'conversions',
          :action => 'energy_conversion')
  end

  it "GET /conversions/power_conversion should route to 'conversions#power_conversion'" do
    expect(:get => '/conversions/power_conversion').
      to route_to(:controller => 'conversions',
          :action => 'power_conversion')
  end

  it "POST /conversions/power_conversion should route to 'conversions#power_conversion'" do
    expect(:post => '/conversions/power_conversion').
      to route_to(:controller => 'conversions',
          :action => 'power_conversion')
  end

end