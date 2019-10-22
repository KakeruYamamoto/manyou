class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :datetime, null: false, default: -> { 'NOW()' }
    add_column :tasks, :status, :string
  end
end
