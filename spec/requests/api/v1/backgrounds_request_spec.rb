require 'rails_helper'

RSpec.describe 'Image request Spec' do
  describe 'GET /api/v1/backgrounds?query=denver,co' do
    it 'gets image for a given query', :vcr do
      get '/api/v1/backgrounds?query=denver,co'
      
      image = JSON.parse(response.body, symbolize_names: :true)

      expect(response).to be_successful
      expect(image).to be_a Hash
      expect(image[:data]).to be_a Hash
      expect(image[:data][:id]).to eq 'null'
      expect(image[:data][:type]).to eq 'image'
      expect(image[:data][:attributes]).to be_a Hash
      expect(image[:data][:attributes].keys).to eq [:description, :image_url, :credit_information]
      expect(image[:data][:attributes][:description]).to be_a String
      expect(image[:data][:attributes][:image_url]).to be_a String
      expect(image[:data][:attributes][:credit_information]).to be_a Hash
      expect(image[:data][:attributes][:credit_information].keys).to eq [:source, :photographer, :account_page]
      expect(image[:data][:attributes][:credit_information][:source]).to be_a String
      expect(image[:data][:attributes][:credit_information][:photographer]).to be_a String
      expect(image[:data][:attributes][:credit_information][:account_page]).to be_a String
    end
  end
end