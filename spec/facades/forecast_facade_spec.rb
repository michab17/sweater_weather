require 'rails_helper'

RSpec.describe 'Forecast facade spec' do
  describe 'creates weather poros' do
    it 'returns an instance of weather' do
      weather = ForecastFacade.get_weather('39.7385', '-104.9849')
      
      expect(weather).to be_a Forecast
      expect(weather.id).to eq 'null'
      expect(weather.type).to eq 'forecast'
      expect(weather.current_weather).to be_a Hash
      expect(weather.daily_weather).to be_an Array
      expect(weather.hourly_weather).to be_an Array
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