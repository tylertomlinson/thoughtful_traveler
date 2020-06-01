class EmailController < ApplicationController

  def create
    recipients_email = params[:recipients_email]
    email_info = {user: current_user,
                 }
  begin
    TripMailer.send_email(email_info, recipients_email).deliver_now
    flash[:notice] = "Your email was successfully sent"
  rescue StandardError
    flash[:message] = errors.message
  end
  redirect_to user_path
  end
end
