class Housework < ApplicationRecord
  has_many :housework_users, dependent: :destroy
  has_many :users, through: :housework_users
  has_many :records, dependent: :destroy
  has_one_attached :image

  validates :housework_name, presence: true
end