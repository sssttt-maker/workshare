class AddUserRefAndRoomRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :room, null: false, foreign_key: true
    change_column_null :messages, :room_id, false
  end
end
