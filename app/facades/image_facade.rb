class ImageFacade
  class << self
    def get_image(query)
      image_data = ImageService.get_image(query)

      Image.new(image_data[:results][0])
    end
  end
end