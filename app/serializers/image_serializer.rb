class ImageSerializer
  include JSONAPI::Serializer

  set_type :image

  attributes :description, :image_url, :credit_information
end