require 'rails_helper'

RSpec.describe 'Forecast show spec' do
  describe 'GET /api/v1/forecast?location=denver,co' do
    it 'gets weather for a given location', :vcr do
      get '/api/v1/forecast?location=denver,co'
      
      forecast = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to be_successful
      expect(forecast[:data][:attributes][:current_weather].keys).to eq [:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon]
      expect(forecast[:data][:attributes][:daily_weather][0].keys).to eq [:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon]
      expect(forecast[:data][:attributes][:hourly_weather][0].keys).to eq [:time, :temperature, :conditions, :icon]
    end
  end
end