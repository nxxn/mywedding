class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :check_layout

  before_action :authenticate_user!

  before_filter :set_locale

  def default_url_options(options={})
    if I18n.locale != I18n.default_locale
      { :locale => I18n.locale }
    else
      { :locale => I18n.default_locale }
    end
  end

  protected

  def check_layout
    user_signed_in? ? 'application' : false
  end

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale] ||= I18n.default_locale
  end
end
