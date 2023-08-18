require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @author = FactoryBot.create(:user)
    @expense = FactoryBot.create(:expense, author: @author)
  end

  it 'Author must exist' do
    @expense.author = nil
    expect(@expense).to_not be_valid
  end

  it 'Name must not be empty' do
    @expense.name = ''
    expect(@expense).to_not be_valid
  end

  it 'Name must have minimum length 2' do
    @expense.name = 'l'
    expect(@expense).to_not be_valid
  end

  it 'Amount must not be greater than 0' do
    @expense.amount = 0
    expect(@expense).to_not be_valid
  end

  it 'Amount must not be empty' do
    @expense.amount = ''
    expect(@expense).to_not be_valid
  end

  it 'Amount must be a number' do
    @expense.amount = 'l'
    expect(@expense).to_not be_valid
  end
end
