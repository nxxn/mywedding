class HomeController < ApplicationController

  def index
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    @articles = Article.where( "lv = ? AND ru = ? AND en = ? AND active = ?", lv_locale, ru_locale, en_locale, true ).limit(4).order("created_at DESC")
    @works = Work.where( "lv = ? AND ru = ? AND en = ? AND active = ?", lv_locale, ru_locale, en_locale, true ).limit(3).order("order_number ASC")
  end

end
