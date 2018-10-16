class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :primerApellido, :segundoApellido, :locale])
    end

  private

    def set_locale
      if current_user
        session[:locale] = current_user.locale || I18n.default_locale
      elsif params[:locale].present?
        session[:locale] = params[:locale]
      end
      I18n.locale = session[:locale] || I18n.default_locale
    end
end
