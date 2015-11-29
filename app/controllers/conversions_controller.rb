class ConversionsController < ApplicationController
  def length_conversion

    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'ft'
    @to = params[:to].presence || 'km'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def weight_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'kg'
    @to = params[:to].presence || 'g'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def time_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'min'
    @to = params[:to].presence || 'sec'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def area_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'sqft'
    @to = params[:to].presence || 'sqin'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def volume_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'liter'
    @to = params[:to].presence || 'gallon'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def speed_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'kph'
    @to = params[:to].presence || 'fps'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def temperature_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'celsius'
    @to = params[:to].presence || 'fahrenheit'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def power_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'horsepower'
    @to = params[:to].presence || 'watts'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end

  def energy_conversion
    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'joule'
    @to = params[:to].presence || 'calories'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  rescue ArgumentError => e
    flash[:error] = e
  end
end
