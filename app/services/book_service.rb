class BookService
  class << self
    def get_books(location, quantity)
      response = conn.get("/search.json?q=#{location}&limit=#{quantity}")
      parse_data(response)
    end

    private

    def conn
      Faraday.new("http://openlibrary.org")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end