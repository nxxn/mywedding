class ArticlesController < ApplicationController

  def index
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    @articles = Article.where( "lv = ? AND ru = ? AND en = ? AND active = ?", lv_locale, ru_locale, en_locale, true ).order("created_at DESC")
    if params[:tag]
      @articles.tagged_with(params[:tag])
    else
      @articles
    end
  end

  def show
    @article = Article.find(params[:id])
  end

end
