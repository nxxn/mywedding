class ArticlesController < ApplicationController

  def index
    if params[:tag]
      if user_signed_in? && current_user.is_admin?
        @articles = Article.all.tagged_with(params[:tag]).order("created_at DESC")
      else
        @articles = Article.where(active: true).tagged_with(params[:tag]).order("created_at DESC")
      end
    else
      if user_signed_in? && current_user.is_admin?
        @articles = Article.all.order("created_at DESC")
      else
        @articles = Article.where(active: true).order("created_at DESC")
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

end
