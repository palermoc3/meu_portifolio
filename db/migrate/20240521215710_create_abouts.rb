# frozen_string_literal: true

class CreateAbouts < ActiveRecord::Migration[7.1]
  def change
    create_table :abouts do |t|
      t.string :title
      t.text :about_text
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
