class Task < ApplicationRecord
    validates :name, presence: true, allow_blank: false

    belongs_to :department
end
