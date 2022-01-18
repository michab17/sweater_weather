class Book
  attr_reader :id,
              :type,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(data)
    @id = 'null'
    @type = 'books'
    @destination = data[:q]
    @forecast = forecast_data(data[:q])
    @total_books_found = data[:numFound]
    @books = books_data(data[:docs])
  end

  def forecast_data(data)
    { 
      forecast: { 
        summary: ForecastFacade.get_weather(LocationFacade.get_location(data).latitude, LocationFacade.get_location(data).longitude).current_weather[:conditions],
        temperature: ForecastFacade.get_weather(LocationFacade.get_location(data).latitude, LocationFacade.get_location(data).longitude).current_weather[:temperature],
       }
     }
  end

  def books_data(data)
    data.map do |book|
      { 
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
       }
    end
  end
end