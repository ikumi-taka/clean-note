class Housework < ApplicationRecord
  has_many :housework_users
  has_many :users, through: :housework_users

  validates :housework_name, presence: true
  validates :name, presence: true
end
