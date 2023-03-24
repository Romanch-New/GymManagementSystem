class AdminsController < ApplicationController
  before_action :authenticate_admin!
  # load_and_authorize_resource


end
