class Admin::MessagesController < AdminController

  def index
    @messages = Message.all.order("created_at DESC")
  end

  # def show
  #   @work = Work.find(params[:id])
  #
  #   respond_to do |format|
  #     format.html
  #   end
  # end
  #
  # def new
  #   @work = Work.new
  #
  #   respond_to do |format|
  #     format.html
  #   end
  # end
  #
  # def edit
  #   @work = Work.find(params[:id])
  # end
  #
  # def create
  #   @work = Work.new(work_params)
  #
  #   respond_to do |format|
  #     if @work.save
  #       format.html { redirect_to(admin_works_url, :notice => 'Work was successfully created.') }
  #     else
  #       @works = Work.all
  #       format.html { render :action => "new" }
  #     end
  #   end
  # end
  #
  # def update
  #   @work = Work.find(params[:id])
  #
  #   respond_to do |format|
  #     if @work.update_attributes(work_params)
  #
  #       format.html { redirect_to(admin_works_url, :notice => 'Work was successfully updated.') }
  #     else
  #       @works = Work.all
  #       format.html { render :action => "edit" }
  #     end
  #   end
  # end
  #
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(admin_messages_url) }
    end
  end
  #
  # private
  #
  #   def work_params
  #     params.require(:work).permit(:name, :url, :comments, :email, :order_number, :work_image, :active, :lv, :ru, :en, wishes_attributes: [:id, :name, :checked, :_destroy])
  #   end

end
