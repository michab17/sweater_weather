class Api::V1::BookSearchController < ApplicationController
  def index
    render json: BookSerializer.new(BookFacade.get_books(params[:location], params[:quantity]))
  end
end