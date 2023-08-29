class EmpLog < ApplicationRecord
    validates :source_name, presence: true, allow_blank: false
    validates :target_name, presence: true, allow_blank: false
    validates :action, presence: true, allow_blank: false
end
