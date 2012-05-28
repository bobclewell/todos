class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_on
      t.datetime :completed_at
      t.integer :order
      t.integer :user_id

      t.timestamps
    end
  end
end
