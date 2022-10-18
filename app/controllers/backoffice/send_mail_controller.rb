class Backoffice::SendMailController < ApplicationController

  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      AdminMailer.send_message(current_admin, params[:'recipient-name'], params[:'subject-text'], params[:'message-text']).deliver_now
      @notify_message = "Email successfuly sent!"
    rescue
      @notify_message = "Error while sending email. Try again."
    end
      respond_to do |format|
      format.js
    end
  end

end
