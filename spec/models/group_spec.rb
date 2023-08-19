require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'should be valid with a name and icon' do
    user = User.new(full_name: 'Basir', email: 'user@gmail.com', password: '123456')
    group = Group.new(name: 'My Group', icon: 'https://example.com/icon.png', author: user)
    expect(group).to be_valid
  end

  it 'should not be valid without a name' do
    user = User.new(full_name: 'Basir', email: 'user@gmail.com', password: '123456')
    group = Group.new(icon: 'https://example.com/icon.png', author: user)
    expect(group).not_to be_valid
    expect(group.errors.messages[:name]).to include('can\'t be blank')
  end

  it 'should not be valid without an icon' do
    user = User.new(full_name: 'Basir', email: 'user@gmail.com', password: '123456')
    group = Group.new(icon: 'https://example.com/icon.png', author: user)
    group.icon = nil
    expect(group).not_to be_valid
    expect(group.errors.messages[:icon]).to include('can\'t be blank')
  end

  it 'should not be valid without an author' do
    user = User.new(full_name: 'Basir', email: 'user@gmail.com', password: '123456')
    group = Group.new(icon: 'https://example.com/icon.png', author: user)
    group.author = nil
    expect(group).not_to be_valid
    expect(group.errors.messages[:author]).to include('must exist')
  end

  it 'should not be valid with a name shorter than 3 characters' do
    user = User.new(full_name: 'Basir', email: 'user@gmail.com', password: '123456')
    group = Group.new(name: 'My', icon: 'https://example.com/icon.png', author: user)
    expect(group).not_to be_valid
    expect(group.errors.messages[:name]).to include('is too short (minimum is 3 characters)')
  end
end
