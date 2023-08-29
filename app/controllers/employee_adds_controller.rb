class EmployeeAddsController < ApplicationController
    def new
        @employee = Employee.new
    end
    
    def create
        @employee = Employee.new(employee_params)

        if @employee.save
            redirect_to employee_path, notice: "Successfully add new employee" + @employee.name
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