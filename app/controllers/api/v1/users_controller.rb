class Api::V1::UsersController < ApplicationController
  def create
    if User.find_by email: params[:email]
      render json: {error: 'Email has already been taken', status: 400}, status: 400
    else
      if params[:password] == params[:password_confirmation]
        user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: User.create_api_key)
        if user.save
          render json: UsersSerializer.new(user), status: 201
        else
          render json: {error: 'All fields must be filled in', status: 400}, status: 400
        end
      else
        render json: {error: 'Passwords do not match', status: 400}, status: 400
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end