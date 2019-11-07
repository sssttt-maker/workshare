class CreateBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :belongs do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps

      t.index [:user_id, :organization_id], unique: true
    end
  end
end
