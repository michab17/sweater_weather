class Image
  attr_reader :id,
              :type,
              :description,
              :image_url,
              :credit_information

  def initialize(data)
    @id = 'null'
    @type = 'image'
    @description = data[:description]
    @image_url = data[:urls][:raw]
    @credit_information = credit(data[:user])
  end

  def credit(data)
    { 
      source: 'Unsplash',
      photographer: data[:username],
      account_page: data[:links][:self]
     }
  end
end