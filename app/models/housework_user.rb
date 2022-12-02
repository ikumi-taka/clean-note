class HouseworkUser < ApplicationRecord
  belongs_to :user
  belongs_to :housework
end
