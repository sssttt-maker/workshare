class EntryPoint < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :filter_by_room, ->(room_id) { where(room_id: room_id) if room_id }
end
