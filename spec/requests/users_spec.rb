require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'Must have status 200' do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end
end
