class CreateEmpLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :emp_logs do |t|
      t.string :source_name, null: false
      t.string :target_name, null: false
      t.string :action, null: false
      t.string :params

      t.timestamps
    end
  end
end
