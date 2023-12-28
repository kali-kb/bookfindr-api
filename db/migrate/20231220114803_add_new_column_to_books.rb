class AddNewColumnToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :download_link_temp, :text 
  end
end
