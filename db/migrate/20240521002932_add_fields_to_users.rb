class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :role, :integer
    add_column :users, :state, :string
    add_column :users, :cep, :string
    add_column :users, :street, :string
    add_column :users, :number, :integer
    add_column :users, :phone, :string
    add_column :users, :kind, :boolean
  end
end
