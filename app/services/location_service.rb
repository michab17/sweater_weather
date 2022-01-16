class LocationService
  class << self
    def get_location(location)
      response = conn.get("/geocoding/v1/address?location=#{location}")
      parse_data(response)
    end

    private

    def conn
      Faraday.new("http://www.mapquestapi.com") do |x|
        x.params['key'] = ENV['maps_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end