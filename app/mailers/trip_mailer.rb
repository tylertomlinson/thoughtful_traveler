class TripMailer < ApplicationMailer
  def send_email(info, recipients_email)
    current_user = info[:user]
    @trip = current_user.trips.first
    @message = info[:message]
    recipients_email = recipients_email
    mail(to: recipients_email, subject: "Checkout #{current_user.name}'s new trip")
  end
end
