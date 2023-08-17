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

  it 'Name must containe letter only' do
    @expense.name = 'basir2'
    expect(@expense).to_not be_valid
  end

  it 'Amount must not be greater than 0' do
    @expense.amount = 0
    expect(@expense).to_not be_valid
  end

  it 'most_recent_expense must return 3 most recent expenses' do
    4.times do
      FactoryBot.create(:expense, author: @author)
    end
    expect(@author.most_recent_expense.count).to eq(3)
  end

  it 'most_ancient_expense must return 3 most ancient expenses' do
    4.times do
      FactoryBot.create(:expense, author: @author)
    end
    expect(@author.most_ancient_expense.count).to eq(3)
  end

  # it "total_expense must return sum of all user's expenses" do
  #   4.times do
  #     FactoryBot.create(:expense, author:@author, amount:10)
  #   end
  #   expect(@author.total_expense.to_digits).to eq(40)
  # end
end
