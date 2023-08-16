class Expense < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :group_expenses, foreign_key: :expense_id
  has_and_belongs_to_many :groups
  validates_associated :group_expenses
  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
