class Reservation < ApplicationRecord
    belongs_to :reservation_customer
    belongs_to :technician
    belongs_to :service_item
    validates :reservation_locator, presence: true, allow_blank: false
end
