class HomeController < ApplicationController

  def index
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    @articles = Article.where( "lv = ? OR ru = ? OR en = ? AND active = ?", lv_locale, ru_locale, en_locale, true ).limit(4).order("created_at DESC")
  end

end
