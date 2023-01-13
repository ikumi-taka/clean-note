class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :housework_users
  has_many :houseworks, through: :housework_users
  has_many :records
  has_many :like, dependent: :destroy
  has_many :like_records, through: :likes, sorce: :record
end
