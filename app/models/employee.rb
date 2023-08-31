class Employee < ApplicationRecord
    has_secure_password
    
    belongs_to :employee_role

    validates :name, presence: true, allow_blank: false
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    validates :salary, numericality: { greater_than_or_equal_to: 0 }

    def departments
        Department.where(id: EmployeeDepartmentMap.where(employee_id: self.id).pluck(:department_id))
    end

    def tasks
        Task.where(id: EmployeeTaskMap.where(employee_id: self.id).pluck(:task_id))
    end

    def manager?
        self.employee_role.name != "general"
    end

    def department_manager?
        self.employee_role.name == "department manager"
    end

    def company_manager?
        self.employee_role.name == "company manager"
    end
end
