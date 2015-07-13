class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.boolean :checked, default: false
      t.integer :work_id

      t.timestamps null: false
    end
  end
end
