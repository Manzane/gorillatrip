class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username, :nationality, :phone_number, :gender, :date_of_birth])
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

end
