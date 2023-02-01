class Like < ApplicationRecord
  belongs_to :record
  belongs_to :user

  # record_idとuser_idの組は1組だけ
  # validates_uniqueness_of :record_id, scope: :user_id
end
