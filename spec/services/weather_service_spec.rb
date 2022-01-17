require 'rails_helper'

RSpec.describe 'Weather service spec' do
  describe 'OpenWeather api call' do
    it 'returns weather information' do
      lat = '39.738453'
      lon = '-104.984853'

      weather = WeatherService.get_weather(lat, lon)

      expect(weather).to be_a Hash
      expect(weather[:hourly]).to_not eq(nil)
      expect(weather[:daily]).to_not eq(nil)
      expect(weather[:minutely]).to eq(nil)
    end
  end
end