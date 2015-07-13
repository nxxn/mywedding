class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string     :name
      t.string     :url
      t.text       :comments
      t.integer    :order_number
      t.attachment :work_image
      t.boolean    :active

      t.timestamps null: false
    end
  end
end
