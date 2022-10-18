class AdminMailer < ApplicationMailer

  def update_email(current_admin, admin)
    @current_admin = current_admin
    @admin = admin
    mail(to: @admin.email, subject: "Your data was updated!")
  end

  def send_message(current_admin, recipient, subject)
    @current_admin = current_admin
    @recipient = recipient
    @subject = subject
    mail(to: @recipient.email, subject: @subject)
  end
end
