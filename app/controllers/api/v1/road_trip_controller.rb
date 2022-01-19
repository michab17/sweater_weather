class Api::V1::RoadTripController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user != nil
      render json: RoadTripSerializer.new(RoadTripFacade.get_directions(params[:origin], params[:destination]))
    else
      render json: {error: 'API key was not passed or is invalid', status: 401}, status: 401
    end
  end
end