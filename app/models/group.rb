class Group < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :group_expenses, foreign_key: :group_id
  validates_associated :group_expenses
  validates :name, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z]+\z/, messages: "only allows letters" }
  validates :icon, presence: true
end
