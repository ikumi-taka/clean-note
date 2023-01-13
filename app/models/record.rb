class Record < ApplicationRecord
  belongs_to :user
  belongs_to :housework
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :content, presence: true
end
