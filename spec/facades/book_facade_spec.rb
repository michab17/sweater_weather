require 'rails_helper'

RSpec.describe 'Books facade spec' do
  it 'uses the data from the service to create a poro' do
    location = 'denver,co'
    quantity = '5'

    books = BookFacade.get_books(location, quantity)

    expect(books).to be_a(Book)
    expect(books.id).to eq 'null'
    expect(books.total_books_found).to eq 41221
    expect(books.books.count).to eq 5
  end
end