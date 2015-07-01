class WorksController < ApplicationController

  def show
    @template_key = params[:key]

    render(:partial => @template_key, :layout => 'works')
  end

end
