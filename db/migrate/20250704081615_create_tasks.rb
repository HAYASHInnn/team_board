class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :deadline, null: false
      t.timestamps
    end
  end
end
