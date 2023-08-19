require 'rails_helper'

RSpec.describe 'expense/index', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @user.save
    @group = FactoryBot.create(:group, author: @user)
    @group.save
    @expense = FactoryBot.create(:expense, author: @user)
    @expense.save
    sign_in @user
  end

  after do
    User.destroy_all
  end

  scenario 'Login' do
    visit new_user_session_path
    click_link @group.name
    expect(page).to have_current_path(group_expenses_path(@group))
    expect(page).to have_content('TRANSACTIONS')
  end
end
