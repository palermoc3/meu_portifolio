class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :weight
      t.float :width
      t.float :length
      t.float :valueSell
      t.float :valueBuy
      t.float :depth
      t.integer :quantity
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
