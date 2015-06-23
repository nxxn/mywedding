class HomeController < ApplicationController

  def index
    @articles = Article.where(active: true).limit(4).order("created_at DESC")
  end

end
