class EmployeeAddsController < ApplicationController
    before_action :require_manager_role!

    def new
        @employee = Employee.new
    end
    
    def create
        @employee = Employee.new(employee_params)

        if @employee.save
            if Current.user.department_manager? && Current.user.departments.length > 0
                EmployeeDepartmentMap.create(employee_id: @employee.id, department_id: Current.user.departments.first.id)
            end

            EmpLog.create(source_name: Current.user.name, target_name: @employee.name, action: "employee_adds#create", params: employee_params.except(:password, :password_confirmation).to_s)

            redirect_to employee_path, notice: "Successfully add new employee " + @employee.name
        else
            if @employee.errors.any?
                flash[:alert] = @employee.errors.full_messages
            end
            
            redirect_to employee_path
        end
    end

    private 

    def employee_params
        params.require(:employee).permit(:name, :email, :employee_role, :password, :password_confirmation, :salary, :address, :employee_role_id, :department_ids)
    end
end