class Room < ApplicationRecord
  has_many :messages
  has_many :entry_points
  has_many :users, through: :entry_points, source: :user
end
