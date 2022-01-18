class RoadTripService
  class << self
    def get_directions(from, to)
      response = conn.get("/directions/v2/route?key=#{ENV['mapquest_api_key']}&from=#{from}&to=#{to}")
      parse_data(response)
    end

    private

    def conn
      Faraday.new("http://www.mapquestapi.com")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end