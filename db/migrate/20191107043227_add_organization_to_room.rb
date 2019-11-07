class AddOrganizationToRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :organization, foreign_key: true
  end
end
