class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :author, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true
      t.string :name
      t.decimal :price
      t.timestamps null: false
    end
  end
end
