class CreateEmployeeDepartmentMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_department_maps do |t|
      t.belongs_to :department, null: false
      t.belongs_to :employee, null: false

      t.timestamps
    end
  end
end
