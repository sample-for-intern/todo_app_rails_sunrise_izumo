class AddColumnsToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :start_day, :date
    add_column :tasks, :end_day, :date

  end
end
