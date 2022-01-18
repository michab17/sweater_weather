require 'rails_helper'

RSpec.describe 'Users request spec' do
  describe 'POST /api/vi/users' do
    it 'creates a new user if the credentials are correct' do
      post '/api/vi/users'

      expect(response).to have_http_status 201
    end
  end
end