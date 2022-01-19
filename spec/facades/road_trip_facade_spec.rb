require 'rails_helper'

RSpec.describe 'Road Trip Facade spec' do
  describe 'creates Road Trip poros' do
    it 'returns and instance of a Road Trip with information if it is possible' do
      from = 'Denver, CO'
      to = 'Estes Park, CO'

      road_trip = RoadTripFacade.get_directions(from, to)

      expect(road_trip).to be_a RoadTrip
      expect(road_trip.start_city).to eq 'Denver, CO'
      expect(road_trip.end_city).to eq 'Estes Park, CO'
      expect(road_trip.travel_time).to be_a String
      expect(road_trip.weather_at_eta).to be_a Hash
      expect(road_trip.weather_at_eta.keys).to eq [:temperature, :conditions]
    end

    it 'returns and instance of a Road Trip with information if it is possible' do
      from = 'Denver, CO'
      to = 'London, UK'

      weather_result = { temperature: "", conditions: "" }

      road_trip = RoadTripFacade.get_directions(from, to)

      expect(road_trip).to be_a RoadTrip
      expect(road_trip.start_city).to eq 'Denver, CO'
      expect(road_trip.end_city).to eq 'London, UK'
      expect(road_trip.travel_time).to be_a String
      expect(road_trip.travel_time).to eq 'impossible route'
      expect(road_trip.weather_at_eta).to be_a Hash
      expect(road_trip.weather_at_eta).to eq weather_result
    end
  end
end