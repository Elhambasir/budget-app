require 'rails_helper'

RSpec.describe 'group/index', type: :feature do
  before(:each) do
    user = FactoryBot.create(:user)
    user.save
    sign_in user
  end

  after do
    User.destroy_all
  end

  scenario 'Login' do
    visit new_user_session_path
    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Add new group')
    click_link 'Add new group'
    expect(page).to have_current_path(new_group_path)
  end
end
