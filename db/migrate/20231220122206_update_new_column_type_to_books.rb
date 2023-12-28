class UpdateNewColumnTypeToBooks < ActiveRecord::Migration[7.1]
  
  def up
    Book.update_all('download_link_temp = download_link')
  end

end
