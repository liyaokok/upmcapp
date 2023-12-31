class SessionsController < ApplicationController
    def new
    end

    def create
        employee = Employee.find_by(email: params[:email])

        if employee.present? && employee.authenticate(params[:password])
            session[:employee_id] = employee.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            redirect_to sign_in_path, alert: "Invalid email or password"
        end
    end

    def destroy
        session[:employee_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end