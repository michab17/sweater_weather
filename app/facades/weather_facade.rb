class WeatherFacade
  class << self
    def get_weather(lat, lon)
      weather_data = WeatherService.get_weather(lat, lon)

      Weather.new(weather_data)
    end
  end
end