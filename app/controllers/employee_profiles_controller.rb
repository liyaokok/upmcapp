class EmployeeProfilesController < ApplicationController
    def new
        @employee = Employee.find_by!(id: params[:id])
    end
end