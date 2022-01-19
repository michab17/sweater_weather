require 'rails_helper'

RSpec.describe 'Forecast facade spec' do
  describe 'creates weather poros', :vcr do
    it 'returns an instance of weather' do
      weather = ForecastFacade.get_weather('39.7385', '-104.9849')
      
      expect(weather).to be_a Forecast
      expect(weather.id).to eq 'null'
      expect(weather.type).to eq 'forecast'
      expect(weather.current_weather).to be_a Hash
      expect(weather.current_weather.keys).to eq [:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon]
      expect(weather.current_weather[:temperature]).to be_a Float
      expect(weather.current_weather[:feels_like]).to be_a Float
      expect(weather.current_weather[:humidity]).to be_an Integer
      expect(weather.current_weather[:uvi]).to be_an Integer
      expect(weather.current_weather[:visibility]).to be_an Integer
      expect(weather.current_weather[:conditions]).to be_a String
      expect(weather.current_weather[:icon]).to be_a String
      expect(weather.daily_weather).to be_an Array
      expect(weather.daily_weather[0].keys).to eq [:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon]
      expect(weather.daily_weather[0][:date]).to be_a Date
      expect(weather.daily_weather[0][:max_temp]).to be_a Float
      expect(weather.daily_weather[0][:min_temp]).to be_a Float
      expect(weather.daily_weather[0][:conditions]).to be_a String
      expect(weather.daily_weather[0][:icon]).to be_a String
      expect(weather.hourly_weather).to be_an Array
      expect(weather.hourly_weather[0].keys).to eq [:time, :temperature, :conditions, :icon]
      expect(weather.hourly_weather[0][:time]).to be_a Time
      expect(weather.hourly_weather[0][:temperature]).to be_a Float
      expect(weather.hourly_weather[0][:conditions]).to be_a String
      expect(weather.hourly_weather[0][:icon]).to be_a String
    end

    it 'does not return the fields that are not needed' do
      weather = ForecastFacade.get_weather('39.7385', '-104.9849')

      expect(weather.current_weather).to_not have_key(:pressure)
      expect(weather.current_weather).to_not have_key(:dew_point)
      expect(weather.current_weather).to_not have_key(:clouds)
      expect(weather.current_weather).to_not have_key(:wind_gust)
      expect(weather.current_weather).to_not have_key(:wing_speed)

      expect(weather.daily_weather[0]).to_not have_key(:moonrise)
      expect(weather.daily_weather[0]).to_not have_key(:moonset)
      expect(weather.daily_weather[0]).to_not have_key(:moon_phase)

      expect(weather.hourly_weather[0]).to_not have_key(:feels_like)
      expect(weather.hourly_weather[0]).to_not have_key(:pressure)
      expect(weather.hourly_weather[0]).to_not have_key(:uvi)
      expect(weather.hourly_weather[0]).to_not have_key(:clouds)
      expect(weather.hourly_weather[0]).to_not have_key(:humidity)
    end
  end
end