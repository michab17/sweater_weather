class Forecast
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @id = 'null'
    @type = 'forecast'
    @current_weather = data[:current]
    @daily_weather = data[:daily]
    @hourly_weather = data[:hourly]
  end
end