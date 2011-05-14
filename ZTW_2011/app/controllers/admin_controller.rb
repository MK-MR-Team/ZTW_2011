class AdminController < ApplicationController

  before_filter "is_admin_logged"

  def index
  end

  def is_admin_logged
    redirect_to login_url and return if !user_logged?
    redirect_to forbidden_url if !logged_user.admin
  end
end