class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: ImageSerializer.new(ImageFacade.get_image(params[:query]))
  end
end