class ForecastService
  class << self
    def get_weather(lat, lon)
      response = conn.post("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&appid=#{ENV['appid']}&units=imperial&exclude=minutely")
      parse_data(response)
    end

    private

    def conn
      Faraday.new("https://api.openweathermap.org")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end