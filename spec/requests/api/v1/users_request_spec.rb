require 'rails_helper'

RSpec.describe 'Users request spec' do
  describe 'POST /api/vi/users' do
    it 'creates a new user if the credentials are correct' do
      process :post, '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }

      user = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to have_http_status 201
      expect(user).to be_a Hash
      expect(user[:data].keys).to eq [:id, :type, :attributes]
      expect(user[:data][:id]).to be_an String
      expect(user[:data][:type]).to be_a String
      expect(user[:data][:attributes]).to be_a Hash
      expect(user[:data][:attributes].keys).to eq [:email, :api_key]
      expect(user[:data][:attributes][:email]).to be_a String
      expect(user[:data][:attributes][:api_key]).to be_a String
    end

    it 'returns a failure message if email is taken' do
      process :post, '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }

      process :post, '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }

      error = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to have_http_status 400
      expect(error[:error]).to eq 'Email has already been taken'
    end

    it 'returns a failure message if passwords do not match' do
      process :post, '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password1"
      }

      error = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to have_http_status 400
      expect(error[:error]).to eq 'Passwords do not match'
    end

    it 'returns a failure message if all fields are not filled in' do
      process :post, '/api/v1/users', params: {
        password: "password",
        password_confirmation: "password"
      }

      error = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to have_http_status 400
      expect(error[:error]).to eq 'All fields must be filled in'
    end
  end
end