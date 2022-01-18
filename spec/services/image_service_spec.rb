require 'rails_helper'

RSpec.describe 'Image service spec' do
  describe 'calls the unsplash api', :vcr do
    it 'returns image information based on a search query' do
      query = 'denver,co'

      image_data = ImageService.get_image(query)

      expect(image_data).to be_a Hash
      expect(image_data[:results]).to be_an Array
      expect(image_data[:results][0]).to be_an Hash
      expect(image_data[:results][0][:urls]).to be_an Hash
      expect(image_data[:results][0][:urls][:raw]).to be_a String
    end
  end
end