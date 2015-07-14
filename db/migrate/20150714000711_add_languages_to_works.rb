class AddLanguagesToWorks < ActiveRecord::Migration
  def change
    add_column :works, :ru, :boolean, default: false
    add_column :works, :lv, :boolean, default: false
    add_column :works, :en, :boolean, default: false
  end
end
