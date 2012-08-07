class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.integer :order
      t.boolean :done

      t.timestamps
    end
  end
end
