class LocationFacade
  class << self
    def get_location(location)
      location_params = LocationService.get_location(location)[:results][0][:locations][0][:displayLatLng]
      
      Location.new(location_params)
    end
  end
end