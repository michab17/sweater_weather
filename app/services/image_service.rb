class ImageService
  class << self
    def get_image(query)
      response = conn.get("/search/photos?client_id=#{ENV['client_id']}&query=#{query}")
      parse_data(response)
    end

    private

    def conn
      Faraday.new("https://api.unsplash.com")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end