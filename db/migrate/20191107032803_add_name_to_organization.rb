class AddNameToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :name, :string, null: false, default: "organization"
  end
end
