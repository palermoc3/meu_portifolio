class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.integer :kind
      t.integer :theme
      t.integer :payroll_day
      t.references :administrator, null: false, foreign_key: true
      t.string :name
      t.string :facebook
      t.string :instagram
      t.string :twitter

      t.timestamps
    end
  end
end
