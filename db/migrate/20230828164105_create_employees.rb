class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false, index: true
      t.string :email, null: false, index: { unique: true, name: 'unique_emails' }
      t.decimal :salary, precision: 12, scale: 2, index: true
      t.string :address
      t.string :password_digest

      t.belongs_to :employee_role, null: false

      t.timestamps
    end
  end
end
