class ProfilesController < ApplicationController
    before_action :require_user_logged_in!

    def new
    end

    def update        
        if Current.user.update(profile_params)
            EmpLog.create(source_name: Current.user.name, target_name: Current.user.name, action: "profiles#update", params: profile_params.to_s)

            redirect_to root_path, notice: "Profile update successfully"
        else
            redirect_to edit_password_path, alert: "Profile update failed"
        end
    end

    private 

    def profile_params
        params.require(:employee).permit(:name, :email, :address)
    end
end