class CreateReservationCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :reservation_customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone_number, null: false
      t.boolean :is_confirmed, default: false
      t.boolean :is_fulfilled, default: false
      
      t.timestamps
    end
  end
end
