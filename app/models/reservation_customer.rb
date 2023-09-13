class ReservationCustomer < ApplicationRecord
    validates :phone_number, phone: true, allow_blank: false
    validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
end
