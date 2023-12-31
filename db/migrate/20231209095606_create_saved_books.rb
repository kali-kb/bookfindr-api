class CreateSavedBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
