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
end
