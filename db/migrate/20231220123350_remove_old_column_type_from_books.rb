class RemoveOldColumnTypeFromBooks < ActiveRecord::Migration[7.1]

  def change
    remove_column :books, :download_link
    rename_column :books, :download_link_temp, :download_link
  end
  
end
