class EmployeeProfilesController < ApplicationController
    def new
        @employee = target_employee
    end

    def update
        if target_employee.nil?
            redirect_to root_path, alert: "Employee with id #{params[:id]} not found." 
            return
        end

        unless update_permission?
            redirect_to root_path, alert: "You don't have permission to update this employee" 
            return
        end

        if target_employee.update(profile_params)
            EmpLog.create(source_name: Current.user.name, target_name: target_employee.name, action: "employee_profiles#update", params: profile_params.to_s)

            redirect_to employee_path, notice: "Employee #{target_employee.name}'s profile update successfully"
        else
            redirect_to employee_path, alert: "Employee #{target_employee.name}'s profile update failed"
        end
    end

    def destroy
        employee = Employee.find_by!(id: params[:id])

        if employee.destroy
            #todo: transaction
            EmployeeDepartmentMap.where(employee_id: employee.id).destroy_all
            EmployeeTaskMap.where(employee_id: employee.id).destroy_all

            EmpLog.create(source_name: Current.user.name, target_name: employee.name, action: "employee_profiles#destroy", params: {id: params[:id]}.to_s )

            redirect_to employee_path, notice: "Employee #{employee.name}'s profile has been removed."
        else
            redirect_to employee_path, alert: "Employee #{target_employee.name}'s profile remove failed"
        end    
    end

    private

    def profile_params
        params.require(:employee).permit(:name, :email, :address, :salary)
    end

    def update_permission?
        if current_user_role == "company manager"
            true
        elsif current_user_role == "department manager"
            !(target_employee.departments.pluck(:id) & Current.user.departments.pluck(:id)).empty?
        else
            false
        end
    end

    def current_user_role
        @current_user_role ||= Current.user.employee_role&.name
    end

    def target_employee
        @target_employee ||= Employee.find_by!(id: params[:id])
    end
end