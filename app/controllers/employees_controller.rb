class EmployeesController < ApplicationController
    before_action :require_user_logged_in!
    before_action :require_manager_role!

    def new
        @my_employees = my_employees
    end

    private 

    def require_manager_role!
        redirect_to root_path, alert: "You must be a manager role in order to manage employees" unless Current.user&.manager?
    end

    def my_employees  
        if Current.user.department_manager?
            uniqe_employee_ids = EmployeeDepartmentMap.where(department_id: Current.user.departments.pluck(:id)).pluck(:employee_id).uniq
            
            Employee.where(id: uniqe_employee_ids)
        else
            Employee.all
        end    
    end

    def my_departments
        Current.user.departments
    end


end