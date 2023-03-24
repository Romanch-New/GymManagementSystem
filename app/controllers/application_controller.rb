class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # redirect_to new_user_session_path unless current_user && current_user.admin?
end
