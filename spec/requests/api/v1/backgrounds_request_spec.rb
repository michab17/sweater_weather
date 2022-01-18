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
      expect(image[:data][:attributes][:credit_information].keys).to eq [:source, :photographer, :account_page]
    end
  end
end