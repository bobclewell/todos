class AddPositionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :position, :integer
    remove_column :tasks, :order
  end
end
