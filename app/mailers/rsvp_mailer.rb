class RsvpMailer < ActionMailer::Base
  default :from => "info@mywedding.lv"

  def rsvp_answer(params)
    @work = Work.find(params[:work_id])

    @person_name = params[:name]
    @is_going_to_ceremony = params[:is_going_to_ceremony]
    @is_going_to_banket = params[:is_going_to_banket]
    @comment = params[:comment]

    mail(:to => "info@mywedding.lv", :subject => "Contact form")
  end
end
