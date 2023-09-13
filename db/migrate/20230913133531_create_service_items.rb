class CreateServiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :service_items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.decimal :amount, precision: 12, scale: 2

      t.timestamps
    end
  end
end
