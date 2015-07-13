class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.string :from
      t.text :text
      t.integer :work_id

      t.timestamps null: false
    end
  end
end
