class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :title, default: ""
      t.text :text, default: ""
      t.text :short_description, default: ""
      t.boolean :active, default: false

      t.boolean :ru, default: false
      t.boolean :lv, default: false
      t.boolean :en, default: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :articles
  end
end
