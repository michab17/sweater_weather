class RoadTripFacade
  class << self
    def get_directions(from, to)
      direction_data = RoadTripService.get_directions(from, to)

      RoadTrip.new(direction_data, from, to)
    end
  end
end