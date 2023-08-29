class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:employee_id]
            Current.user = Employee.find_by(id: session[:employee_id])
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must sign in first." if Current.user.nil?
    end

    def require_manager_role!
        redirect_to root_path, alert: "You must be a manager role in order to manage employees" unless Current.user&.manager?
    end

    def require_company_manager_role!
        redirect_to root_path, alert: "You must be a company manager in order to access" unless Current.user&.company_manager?
    end
end
