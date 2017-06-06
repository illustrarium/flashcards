class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    locale =  if current_user
                current_user.locale
              elsif params[:locale]
                session[:locale] = params[:locale]
              elsif session[:locale]
                session[:locale]
              else
                http_accept_language.compatible_language_from(I18n.available_locales)
              end

    return unless locale && I18n.available_locales.include?(locale.to_sym)
    session[:locale] = I18n.locale = locale.to_sym
  end

  private

  def not_authenticated
    redirect_to login_path, alert: t("please_login")
  end
end
