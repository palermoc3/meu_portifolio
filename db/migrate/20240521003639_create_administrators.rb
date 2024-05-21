class CreateAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :administrators do |t|
      t.string :cnpj
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
