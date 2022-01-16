require 'rails_helper'

RSpec.describe 'Location facade spec' do
  describe 'creates Location poros' do
    it 'returns a Location, consisting of latitude and longitude' do
      location = LocationFacade.get_location('Denver,CO')

      expect(location).to be_a Location
      expect(location.latitude).to eq(39.738453)
      expect(location.longitude).to eq(-104.984853)
    end
  end
end