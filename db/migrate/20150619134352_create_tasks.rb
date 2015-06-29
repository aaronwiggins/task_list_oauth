class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :start_on
      t.date :due_on
      t.boolean :completed
      t.integer :order_number

      t.timestamps null: false
    end
  end
end
