class ArticlesController < ApplicationController

  def index
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    if params[:tag]
      @articles = Article.where(lv: lv_locale, ru: ru_locale, en: en_locale, active: true).tagged_with(params[:tag]).order("created_at DESC")
    else
      @articles = Article.where(lv: lv_locale, ru: ru_locale, en: en_locale, active: true).order("created_at DESC")
    end
  end

  def show
    @article = Article.find(params[:id])
  end

end
