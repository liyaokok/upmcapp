class EmployeeRole < ApplicationRecord
    validates :name, presence: true, allow_blank: false

    has_many :employees
end
