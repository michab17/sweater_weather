class RoadTrip
  attr_reader :id,
              :type,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data, from, to)
    @id = 'null'
    @type = 'roadtrip'
    @start_city = from
    @end_city = to
    @travel_time = get_travel_time(data)
    @weather_at_eta = get_weather
  end

  def get_travel_time(data)
    if data[:route][:routeError]
      'impossible route'
    else
      data[:route][:formattedTime]
    end
  end

  def get_hours
    split_time = @travel_time.split(':')
    if split_time[1].to_i >= 30
      hours = split_time[0].to_i + 1
    else
      hours = split_time[0].to_i
    end
  end
  
  def get_days
    hours = get_hours
    if hours > 8 && hours < 24
      days = 1
    elsif hours > 24
      days = hours / 24
    end
  end

  def get_weather
    if @travel_time != 'impossible route'
      weather = ForecastFacade.get_weather(LocationFacade.get_location(@end_city).latitude, LocationFacade.get_location(@end_city).longitude)
      hours = get_hours
      days = get_days
      if hours > 8
        information = weather.daily_weather.select { |forecast| forecast[:date] == Date.now + days }
        result = { temperature: information[0][:max_temp], conditions: information[0][:conditions] }
      elsif hours <= 8
        information = weather.hourly_weather.select { |forecast| forecast[:time] == Time.now.beginning_of_hour + (hours * 3600) }
        result = { temperature: information[0][:temperature], conditions: information[0][:conditions] }
      end
    else
      { temperature: "", conditions: "" }
    end
  end
end