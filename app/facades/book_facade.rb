class BookFacade
  class << self
    def get_books(location, quantity)
      books_data = BookService.get_books(location, quantity)

      Book.new(books_data)
    end
  end
end