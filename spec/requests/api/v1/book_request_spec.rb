require 'rails_helper'

RSpec.describe 'Book request spec' do
  describe 'GET /api/v1/book_search?location=denver,co&quantity=5', :vcr do
    it 'returns structured JSON response' do
      get '/api/v1/book_search?location=denver,co&quantity=5'

      books = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to be_successful
      expect(books).to be_a Hash
      expect(books[:data]).to be_a Hash
      expect(books[:data].keys).to eq [:id, :type, :attributes]
      expect(books[:data][:id]).to be_a String
      expect(books[:data][:id]).to eq 'null'
      expect(books[:data][:type]).to be_a String
      expect(books[:data][:type]).to eq 'books'
      expect(books[:data][:attributes]).to be_a Hash
      expect(books[:data][:attributes].keys).to eq [:destination, :forecast, :total_books_found, :books]
      expect(books[:data][:attributes][:destination]).to be_a String
      expect(books[:data][:attributes][:destination]).to eq 'denver,co'
      expect(books[:data][:attributes][:forecast]).to be_a Hash
      expect(books[:data][:attributes][:forecast][:forecast].keys).to eq [:summary, :temperature]
      expect(books[:data][:attributes][:forecast][:forecast][:summary]).to be_a String
      expect(books[:data][:attributes][:total_books_found]).to be_an Integer
      expect(books[:data][:attributes][:books]).to be_an Array
      expect(books[:data][:attributes][:books][0].keys).to eq [:isbn, :title, :publisher]
      expect(books[:data][:attributes][:books][0][:isbn]).to be_an Array
      expect(books[:data][:attributes][:books][0][:title]).to be_a String
      expect(books[:data][:attributes][:books][0][:publisher]).to be_an Array
    end
  end
end