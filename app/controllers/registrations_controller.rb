class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account " + @user.email
        else
            if @user.errors.any?
                flash[:alert] = @user.errors.full_messages
            end
            
            redirect_to sign_up_path
        end
    end

    private 

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end