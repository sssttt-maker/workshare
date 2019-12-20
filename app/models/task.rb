class Task < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  belongs_to :organization
end
