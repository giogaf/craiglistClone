class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :titulo
      t.string :descripcion
      t.references :category, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
