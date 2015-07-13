class WorksController < ApplicationController
  layout "works", :only => [ :show ]
  layout "application", :only => [ :index ]

  def index
    @works = Work.where(active: true).order("order_number ASC")
  end

  def show
    @template_key = params[:key]
    @work = Work.where(url: @template_key).first
    if @work.wishes
      @wishes = @work.wishes.order("checked ASC")
    end
    @greeting = Greeting.new
  end

  def submit_wish
    @wish = Wish.find(params["wish_id"])
    @wish.checked = true
    @wish.save

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def send_greeting
    @greeting = Greeting.new(greeting_params)
    @greeting.save

    redirect_to :back
  end

  private

    def greeting_params
      params.require(:greeting).permit(:from, :text, :work_id)
    end


end
