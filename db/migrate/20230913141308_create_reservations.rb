class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :reservation_customer, null: false
      t.belongs_to :technician, null: false
      t.belongs_to :service_item, null: false
      t.string :reservation_locator, null: false, index: { unique: true, name: 'unique_reservation_locators' }
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false

      t.timestamps
    end
  end
end
