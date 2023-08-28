class CreateEmployeeTaskMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_task_maps do |t|
      t.belongs_to :task, null: false
      t.belongs_to :employee, null: false

      t.timestamps
    end
  end
end
