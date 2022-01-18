require 'rails_helper'

RSpec.describe 'Image Facade spec' do
  describe 'creates an image poro', :vcr do
    it 'returns an instance of Image' do
      image = ImageFacade.get_image('denver,co')

      expect(image).to be_an Image
      expect(image.id).to eq 'null'
      expect(image.type).to eq 'image'
      expect(image.image_url).to be_a String
      expect(image.description).to be_a String
      expect(image.credit_information).to be_a Hash
      expect(image.credit_information.keys).to include(:source, :photographer, :account_page)
    end
  end
end