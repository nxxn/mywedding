class WorksController < ApplicationController
  layout "works"

  def show
    @template_key = params[:key]
  end

end
