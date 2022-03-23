class UserMailer < ApplicationMailer
  # Important for production
  default from: "vnggrpstockapp@gmail.com"

  def approve_email
    @user = params[:user]

    mail to: @user.email, subject: "Your account had been approved"
  end

  def decline_email
    @user = params[:user]

    mail to: @user.email, subject: "Your account had been declined"
  end
end
