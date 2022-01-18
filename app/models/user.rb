require 'securerandom'

class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest

  has_secure_password

  def self.create_api_key
    random_string = SecureRandom.hex
  end
end