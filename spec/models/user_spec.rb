require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Check rspec working?' do
    user = FactoryBot.create(:user)
    expect(user.full_name).to eq('basir')
  end

  it 'full_name must be present' do
    user = FactoryBot.create(:user)
    user.full_name = nil
    expect(user).to_not be_valid
  end

  it 'full_name must have length of minimum 3 ch' do
    user = FactoryBot.create(:user)
    user.full_name = 'lg'
    expect(user).to_not be_valid
  end

  it 'Email must not be empty' do
    user = FactoryBot.create(:user)
    user.email = ''
    expect(user).to_not be_valid
  end

  it 'Password must not be empty' do
    user = FactoryBot.create(:user)
    user.password = ''
    expect(user).not_to be_valid
  end

  it 'Password must bo longer than 6 char...' do
    user = FactoryBot.create(:user)
    user.password = 'elham'
    expect(user).not_to be_valid
  end
end
