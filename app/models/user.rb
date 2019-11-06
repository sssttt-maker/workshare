class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :messages, dependent: :restrict_with_error # 子レコードがある場合は削除できず、親レコードにエラー情報が付加される。（引き留めパターン）
  has_many :entry_points
  has_many :rooms, through: :entry_points, source: :room

  def join(other_room)
    self.entry_points.find_or_create_by(room_id: other_room.id)
  end

  def leave(other_room)
    entry_point = self.entry_points.find_by(room_id: other_room.id)
    entry_point.destroy if entry_point
  end

  def is_joinning?(other_room)
    self.rooms.include?(other_room)
  end

end
