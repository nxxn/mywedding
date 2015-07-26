class ContactFormMailer < ActionMailer::Base
  default :from => "info@mywedding.lv"
  default :to => "info@mywedding.lv"

  def new_contact_form_message(message)
    @message = message
    mail(:subject => "Contact form")
  end
end
