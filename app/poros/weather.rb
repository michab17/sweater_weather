class Weather
  attr_reader :id,
              :type,
              :current,
              :daily,
              :hourly

  def initialize(data)
    @id = 'null'
    @type = 'forecast'
    @current = data[:current]
    @daily = data[:daily]
    @hourly = data[:hourly]
  end
end