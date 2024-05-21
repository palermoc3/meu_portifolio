class CreatePayrolls < ActiveRecord::Migration[7.1]
  def change
    create_table :payrolls do |t|
      t.date :date_of_payroll
      t.float :commission
      t.float :discount
      t.float :salary
      t.string :description
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
