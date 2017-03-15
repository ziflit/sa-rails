class CreateBookSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :book_suggestions do |t|
      t.string :editorial
      t.float :price
      t.string :author
      t.string :title
      t.string :link
      t.string :publisher
      t.string :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
