class Organization < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :belongs
  has_many :users, through: :belongs, source: :user

  has_many :rooms
  has_many :tasks
end
