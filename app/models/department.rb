class Department < ApplicationRecord
    validates :name, presence: true, allow_blank: false

    has_many :tasks
end
