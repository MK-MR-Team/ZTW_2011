class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_user
    if request == nil then return nil end
    return request.session_options[:user]
  end
end
