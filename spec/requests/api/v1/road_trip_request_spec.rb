require 'rails_helper'

RSpec.describe 'Road Trip Request specs' do
  describe 'POST /api/v1/road_trip' do
    before :each do
      @user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', api_key: User.create_api_key)
    end

    it 'if all params are present it returns all the needed information for the road trip' do
      process :post, '/api/v1/road_trip', params: {
        origin: "Denver, CO",
        destination: "Estes Park, CO",
        api_key: "#{@user.api_key}"
      }

      road_trip = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to be_successful
      expect(road_trip[:data].keys).to eq [:id, :type, :attributes]
      expect(road_trip[:data][:id]).to eq 'null'
      expect(road_trip[:data][:type]).to eq 'roadtrip'
      expect(road_trip[:data][:attributes].keys).to eq [:start_city, :end_city, :travel_time, :weather_at_eta]
      expect(road_trip[:data][:attributes][:start_city]).to eq 'Denver, CO'
      expect(road_trip[:data][:attributes][:end_city]).to eq 'Estes Park, CO'
      expect(road_trip[:data][:attributes][:travel_time]).to be_a String
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a Hash
      expect(road_trip[:data][:attributes][:weather_at_eta].keys).to eq [:temperature, :conditions]
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a String
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
    end

    it 'returns an error if api_key is not present' do
      process :post, '/api/v1/road_trip', params: {
        origin: "Denver, CO",
        destination: "Estes Park, CO"
      }

      error = JSON.parse(response.body, symbolize_names: :true)

      expect(response.status).to eq 401
      expect(error[:error]).to eq 'API key was not passed or is invalid'
    end

    it 'returns an error if api_key is incorrect' do
      process :post, '/api/v1/road_trip', params: {
        origin: "Denver, CO",
        destination: "Estes Park, CO",
        api_key: '1234'
      }

      error = JSON.parse(response.body, symbolize_names: :true)

      expect(response.status).to eq 401
      expect(error[:error]).to eq 'API key was not passed or is invalid'
    end
  end
end