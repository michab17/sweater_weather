require 'rails_helper'

RSpec.describe 'Book Service spec' do
  describe 'Openlibrary api call' do
    it 'returns the result of an Openlibrary API call' do
      location = 'denver,co'
      quantity = 5

      books = BookService.get_books(location, quantity)

      expect(books).to be_a Hash
      expect(books[:numFound]).to be_an Integer
      expect(books[:docs].count).to eq 5
    end
  end
end