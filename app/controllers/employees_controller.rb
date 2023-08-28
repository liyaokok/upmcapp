class EmployeesController < ApplicationController
    before_action :require_user_logged_in!
    before_action :require_manager_role!

    def new
    end

    private 

    def require_manager_role!
        redirect_to root_path, alert: "You must be a manager role in order to manage employees" unless Current.user&.manager?
    end
end