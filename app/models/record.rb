class Record < ApplicationRecord
  belongs_to :user
  belongs_to :housework

  validates :content, presence: true
end
