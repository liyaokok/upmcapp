class Reservation < ApplicationRecord
    belongs_to :reservation_customer, optional: true
    belongs_to :technician
    belongs_to :service_item, optional: true

    validates :reservation_locator, presence: true, allow_blank: false
    validates :start_at, presence: true
    validates :end_at, presence: true
end
