require 'rails_helper'

RSpec.describe 'Weather service spec' do
  describe 'OpenWeather api call' do
    it 'returns weather information' do
      params = {
        lat: '39.738453',
        lon: '-104.984853'
      }

      weather = WeatherService.get_weather(params)

      expect(weather).to be_a Hash
    end
  end
end