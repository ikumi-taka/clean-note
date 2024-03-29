class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :housework_users
  has_many :houseworks, through: :housework_users
  has_many :records
  has_many :likes
  # , dependent: :destroy
  # has_many :like_records, through: :likes, source: :record

  # likesテーブルにrecord_idが存在しているかどうか検索をかける
  def liked_by?(record_id)
    likes.where(record_id: record_id).exists?
  end

  # def own?(object)
  #   id == object.user_id
  # end

  # def like(record)
  #   likes.find_or_create_by(record: record)
  # end

  # def like?(record)
  #   like_records.include?(record)
  # end

  # def unlike(record)
  #   like_records.delete(record)
  # end
end
