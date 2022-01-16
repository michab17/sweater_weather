require 'rails_helper'

RSpec.describe 'Location service spec' do
  describe 'Mapquest api call' do
    it 'returns a locations information' do
      location = 'Denver,CO'

      response = LocationService.get_location(location)

      expect(response).to be_a Hash
      expect(response[:results][0][:locations][0][:displayLatLng]).to be_a Hash
      expect(response[:results][0][:locations][0][:displayLatLng][:lat]).to eq(39.738453)
      expect(response[:results][0][:locations][0][:displayLatLng][:lng]).to eq(-104.984853)
    end
  end
end