class CreateEmployeeRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_roles do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
