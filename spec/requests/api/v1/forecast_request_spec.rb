require 'rails_helper'

RSpec.describe 'Forecast show spec' do
  describe 'GET /api/v1/forecast?location=denver,co' do
    it 'gets weather for a given location', :vcr do
      get '/api/v1/forecast?location=denver,co'
      
      forecast = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to be_successful
      expect(forecast[:data][:attributes][:current_weather].keys).to eq [:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon]
      expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a Float
      expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a Float
      expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_an Integer
      expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_an Integer
      expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_an Integer
      expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a String
      expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a String
      expect(forecast[:data][:attributes][:daily_weather][0].keys).to eq [:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon]
      expect(forecast[:data][:attributes][:daily_weather][0][:date]).to be_a String
      expect(forecast[:data][:attributes][:daily_weather][0][:max_temp]).to be_a Float
      expect(forecast[:data][:attributes][:daily_weather][0][:min_temp]).to be_a Float
      expect(forecast[:data][:attributes][:daily_weather][0][:conditions]).to be_a String
      expect(forecast[:data][:attributes][:daily_weather][0][:icon]).to be_a String
      expect(forecast[:data][:attributes][:hourly_weather][0].keys).to eq [:time, :temperature, :conditions, :icon]
      expect(forecast[:data][:attributes][:hourly_weather][0][:time]).to be_a String
      expect(forecast[:data][:attributes][:hourly_weather][0][:temperature]).to be_a Float
      expect(forecast[:data][:attributes][:hourly_weather][0][:conditions]).to be_a String
      expect(forecast[:data][:attributes][:hourly_weather][0][:icon]).to be_a String
    end
  end
end