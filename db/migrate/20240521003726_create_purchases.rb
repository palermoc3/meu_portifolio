# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.boolean :paid
      t.float :packageSize
      t.boolean :receive
      t.boolean :closed

      t.timestamps
    end
  end
end
