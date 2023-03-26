# frozen_string_literal: true

class Admin::Users::SessionsController < Devise::SessionsController
  # Require authentication for all actions in this controller
  before_action :authenticate_admin!

  # Use the same layout as the regular users controller
  layout 'application'

  def new
    super
  end

  def create
    # Check if the current user is an admin
    if current_user.admin?
      # Create the user with the special behavior
      @user = User.new(admin_user_params)
      if @user.save
        flash[:notice] = 'User was successfully created.'
        redirect_to admin_users_path
      else
        render :new
      end
    else
      # If the current user is not an admin, redirect to the regular users controller
      redirect_to new_user_registration_path
    end
  end

  private

  # Only allow admin to create user with specific attributes
  def admin_user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end
