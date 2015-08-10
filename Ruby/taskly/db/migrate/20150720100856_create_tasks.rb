class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :details
      t.integer :user_id
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
