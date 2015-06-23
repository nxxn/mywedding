class AddShortDescriptionToArticles < ActiveRecord::Migration
  def up
    Article.add_translation_fields! short_description: :text
  end

  def down
    remove_column :article_translations, :short_description
  end
end
