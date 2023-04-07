class HomeController < ApplicationController
  def index
    if admin_signed_in?
      @users = User.all
    end
  end
end
