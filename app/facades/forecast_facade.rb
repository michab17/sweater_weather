class ForecastFacade
  class << self
    def get_weather(lat, lon)
      weather_data = ForecastService.get_weather(lat, lon)

      Forecast.new(weather_data)
    end
  end
end