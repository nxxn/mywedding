class AddEmailToWorks < ActiveRecord::Migration
  def change
    add_column :works, :email, :string
  end
end
