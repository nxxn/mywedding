class AddMainImageToArticles < ActiveRecord::Migration
  def up
    add_attachment :articles, :main_image
  end

  def down
    remove_attachment :articles, :main_image
  end
end
