class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_expenses, foreign_key: :group_id
  has_many :expenses, through: :group_expenses, dependent: :destroy, source: :expense
  validates_associated :group_expenses
  validates :name, presence: true, length: { minimum: 3 }
  validates :icon, presence: true
end
