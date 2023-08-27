class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            # send email
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to root_path, notice: "We'll send an email to reset password if an account is found."
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Expired token."    
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Password reset successfully. Please sign in."
        else
            flash[:alert] = @user.errors.full_messages;
            redirect_to sign_in_path
        end
    end

    private 

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end