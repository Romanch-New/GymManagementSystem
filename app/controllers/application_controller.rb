class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # # redirect_to new_user_session_path unless current_user && current_user.admins?
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, alert: exception.message
  # end


end
