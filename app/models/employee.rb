class Employee < ApplicationRecord
    has_secure_password
    
    belongs_to :employee_role

    validates :name, presence: true, allow_blank: false
    validates :email, presence: true, uniqueness: true

    def departments
        Department.where(id: EmployeeDepartmentMap.where(employee_id: self.id).pluck(:department_id))
    end
end
