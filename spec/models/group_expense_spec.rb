require 'rails_helper'

RSpec.describe GroupExpense, type: :model do
  it 'Group must exist' do
    user = FactoryBot.create(:user)
    group = FactoryBot.create(:group, author: user)
    expense = FactoryBot.create(:expense, author: user)
    group_expense = FactoryBot.create(:group_expense, group: group, expense: expense)
    group_expense.group = nil
    expect(group_expense).to_not be_valid
  end

  it 'Expense must exist' do
    user = FactoryBot.create(:user)
    group = FactoryBot.create(:group, author: user)
    expense = FactoryBot.create(:expense, author: user)
    group_expense = FactoryBot.create(:group_expense, group: group, expense: expense)
    group_expense.expense = nil
    expect(group_expense).to_not be_valid
  end
end
