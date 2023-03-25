class AdminsController < ApplicationController
  before_action :authenticate_admin!
  # load_and_authorize_resource

  # todo: add more actions for admins.
  # todo: add admin user controller to admin namespace.
  # todo: add roles controller and give admin ability to add roles to users.
  # todo: allow admin to add users and those users will set admin to true.
  # todo: add json response for all actions.
  # todo: give privileges to admin and users as per role to access actions in the application.
  # todo: add routs for admin namespace and other controllers
  # todo: add blog post and comments functionality for users and admins.
  # todo: add admin dashboard to show all users and admins.
  # todo: add admin dashboard to show all roles and users.
  # todo: add admin dashboard to show all roles and admins.
  # todo: add admin dashboard to show all users and roles.
  # todo: add admin dashboard to show all admins and roles.
  # todo: add admin dashboard to show all admins and users.
  # todo: add gym modle that has_many: memberships and has_many: users through: memberships.
  # todo: add membership model that belongs_to: user and belongs_to: gym.
  # todo: add has_many: plans in gym model.
  # todo: add gym mebership functionality for users and admins.
  # todo: add plan model belong to gym. has  many subscriptions dependent destroy.
  # todo: add subscription to gym membership functionality for users and admins.
  # todo: subscriptin belong to user and belong to plan.
  # todo: add payment functionality for users and admins.
  # todo: add payment gateway for users and admins.
  # todo: add analytics for dashboard.
end
