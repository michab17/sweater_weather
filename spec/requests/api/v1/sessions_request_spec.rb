require 'rails_helper'

RSpec.describe 'Sessions Request spec' do
  describe 'POST /api/v1/sessions' do
    before :each do
      user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', api_key: User.create_api_key)
    end
    it 'creates a session and returns user information' do
      process :post, '/api/v1/sessions', params: {
        email: "test@test.com",
        password: "password"
      }

      session = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to have_http_status 200
      expect(session).to be_a Hash
      expect(session[:data].keys).to eq [:id, :type, :attributes]
      expect(session[:data][:id]).to be_an String
      expect(session[:data][:type]).to be_a String
      expect(session[:data][:attributes]).to be_a Hash
      expect(session[:data][:attributes].keys).to eq [:email, :api_key]
      expect(session[:data][:attributes][:email]).to be_a String
      expect(session[:data][:attributes][:api_key]).to be_a String
    end

    it 'returns a generic error if email doesnt exist' do
      process :post, '/api/v1/sessions', params: {
        email: "thisemaildoesnotexist@thisiswrong.com",
        password: "password"
      }

      error = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to have_http_status 400
      expect(error[:error]).to eq 'Email or password is incorrect'
    end

    it 'returns a generic error if password is not correct' do
      process :post, '/api/v1/sessions', params: {
        email: "test4@example.com",
        password: "Thisisnottherightpassword"
      }

      error = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to have_http_status 400
      expect(error[:error]).to eq 'Email or password is incorrect'
    end
  end
end