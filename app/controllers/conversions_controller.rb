class ConversionsController < ApplicationController
  def length_conversion

    @initial_text = params[:initial_text].presence || '10'
    @from = params[:from].presence || 'ft'
    @to = params[:to].presence || 'km'

    @final_text = Unit("#{@initial_text} #{@from}").convert_to(@to)
  end
end