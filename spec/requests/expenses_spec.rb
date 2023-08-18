require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'GET /expenses' do
    it 'Must redirect to the login page' do
      user = FactoryBot.create(:user)
      group = FactoryBot.create(:group, author: user)
      get group_expenses_path(group_id: group.id)
      expect(response).to redirect_to new_user_session_path
    end
  end
end
