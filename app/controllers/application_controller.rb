class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  # # redirect_to new_user_session_path unless current_user && current_user.admins?
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, alert: exception.message
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
