class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :cover
      t.string :author
      t.string :download_link

      t.timestamps
    end
  end
end
