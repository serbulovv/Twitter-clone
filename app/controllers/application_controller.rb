# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = %i[username email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
end
