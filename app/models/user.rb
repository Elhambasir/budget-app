class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, foreign_key: :author_id, dependent: :destroy
  has_many :groups, foreign_key: :author_id, dependent: :destroy
  has_many :group_expenses, through: :groups
  validates_associated :expenses
  validates_associated :groups
  validates :full_name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
