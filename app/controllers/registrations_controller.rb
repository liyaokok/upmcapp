class RegistrationsController < ApplicationController
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        
        if @employee.employee_role.nil?
            @employee.employee_role = EmployeeRole.find_by(name: "general")
        end

        if @employee.save
            session[:employee_id] = @employee.id
            redirect_to root_path, notice: "Successfully created account " + @employee.email
        else
            if @employee.errors.any?
                flash[:alert] = @employee.errors.full_messages
            end
            
            redirect_to sign_up_path
        end
    end

    private 

    def employee_params
        params.require(:employee).permit(:name, :email, :employee_role, :password, :password_confirmation)
    end
end