class MessagesController < ApplicationController

  def send_new_contact_form_message
    @message = Message.new(contact_form_params)
    @message.status = "Sent"
    @message.save

    ContactFormMailer.new_contact_form_message(@message).deliver_later

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def rsvp_answer
    @rsvp = params[:rsvp]

    RsvpMailer.rsvp_answer(@rsvp).deliver_later

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  private

    def contact_form_params
      params.require(:message).permit(:email, :name, :message, :status)
    end

end
