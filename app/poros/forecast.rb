class Forecast
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @id = 'null'
    @type = 'forecast'
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily])
    @hourly_weather = hourly(data[:hourly])
  end

  def current(data)
    { 
      datetime: Time.at(data[:dt]).to_datetime,
      sunrise: Time.at(data[:sunrise]).to_datetime,
      sunset: Time.at(data[:sunset]).to_datetime,
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
     }
  end

  def daily(data)
    data[0..4].map do |day|
      {
        date: Time.at(day[:dt]).to_date,
        sunrise: Time.at(day[:sunrise]).to_datetime,
        sunset: Time.at(day[:sunset]).to_datetime,
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
        }
    end
  end

  def hourly(data)
    data[0..7].map do |hour|
      {
        time: Time.at(hour[:dt]).to_time,
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
        }
    end
  end
end