# frozen_string_literal: true

# admin namespace for admin users controller
module Admins
  # UsersController < ApplicationController
  class Users::UsersController < ApplicationController
    before_action :authenticate_admin!
    # Use the same layout as the regular users controller
    layout 'application'

    def new
      admin = Admin.find_by(admin_id: current_admin.id)
      if admin.present?
        @user = admin.user.new
      else
        # message of unauthorized access to json response
        render json: { message: 'Unauthorized access' }, status: :unauthorized
      end
    end

    def create
      admin = Admin.find_by(admin_id: current_admin.id)
      @user = admin.users.new(admin_user_params)
      @user.admin = true
      if @user.save
        render json: { message: 'User created successfully' }, status: :created
      else
        render json: { message: 'User creation failed' }, status: :unprocessable_entity
      end
    end

    private

    # admins users params
    def admin_user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

    def authenticate_admin!

      return if current_admin

      flash[:alert] = 'You are not authorized to access this resource.'
      redirect_to root_path
    end
  end
end

