class AddExecuteToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :execute_on, :date
  end
end
