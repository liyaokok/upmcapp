class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @greeting = "Hi"

    @token = params[:employee].signed_id(expires_in: 15.minutes, purpose: "password_reset")

    mail to: params[:employee].email
  end
end
