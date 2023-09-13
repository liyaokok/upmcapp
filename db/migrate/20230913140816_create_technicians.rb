class CreateTechnicians < ActiveRecord::Migration[7.0]
  def change
    create_table :technicians do |t|
      t.string :first_name, null: false
      t.string :last_name

      t.belongs_to :location, null: false

      t.timestamps
    end
  end
end
