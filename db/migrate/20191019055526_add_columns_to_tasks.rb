class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :datetime, null: false, default: -> { 'NOW()' }
    add_column :tasks, :status, :string, null: false, default: "未着手"
    add_column :tasks, :priority, :integer, null: false, default: 1
  end
end
