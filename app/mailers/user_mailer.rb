class UserMailer < ApplicationMailer
  # Important for production
  default from: "vnggrpstockapp@gmail.com"

  def approved_email
    @user = params[:user]

    mail to: @user.email, subject: "Your account had been approved"
  end
end
