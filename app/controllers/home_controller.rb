class HomeController < ApplicationController

  def index
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    @articles = Article.where(lv: lv_locale, ru: ru_locale, en: en_locale, active: true).limit(4).order("created_at DESC")
  end

end
