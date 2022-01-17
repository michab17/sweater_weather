require 'rails_helper'

RSpec.describe 'Forecast facade spec' do
  describe 'creates weather poros' do
    it 'returns an instance of weather with only the needed fields' do
      weather = ForecastFacade.get_weather('39.7385', '-104.9849')

      expect(weather).to be_a Forecast
      expect(weather.id).to eq 'null'
      expect(weather.type).to eq 'forecast'
      expect(weather.current_weather).to be_a Hash
      expect(weather.daily_weather).to be_an Array
      expect(weather.hourly_weather).to be_an Array
    end
  end
end