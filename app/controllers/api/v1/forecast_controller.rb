class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(ForecastFacade.get_weather(LocationFacade.get_location(params[:location]).latitude, LocationFacade.get_location(params[:location]).longitude))
  end
end