class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:quantity].to_i > 0
      render json: BookSerializer.new(BookFacade.get_books(params[:location], params[:quantity]))
    else
      render json: {error: 'Please enter a quantity greater than zero', status: 422}, status: 422
    end
  end
end