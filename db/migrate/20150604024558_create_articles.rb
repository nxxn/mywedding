class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.boolean :active

      t.timestamps null: false
    end
    Article.create_translation_table! :title => :string, :text => :text
  end

  def down
    drop_table :articles
    Article.drop_translation_table!
  end
end
