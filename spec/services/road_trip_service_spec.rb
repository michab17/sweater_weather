require 'rails_helper'

RSpec.describe 'Road Trip Service spec' do
  describe 'Mapquest directions api call' do
    it 'returns all information about the directions' do
      from = 'Denver, CO'
      to = 'Estes Park, CO'

      directions = RoadTripService.get_directions(from, to)

      expect(directions).to be_a Hash
      expect(directions[:route]).to be_a Hash
      expect(directions[:route]).to have_key(:formattedTime)
      expect(directions[:route][:formattedTime]).to be_a String
    end

    it 'returns almost no information if the directions are not possible' do
      from = 'Denver, CO'
      to = 'London, UK'

      directions = RoadTripService.get_directions(from, to)

      expect(directions).to be_a Hash
      expect(directions[:route]).to be_a Hash
      expect(directions[:route]).to_not have_key(:formattedTime)
      expect(directions[:route]).to have_key(:routeError)
    end
  end
end