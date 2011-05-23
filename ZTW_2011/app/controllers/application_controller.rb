class ApplicationController < ActionController::Base
  protect_from_forgery

  $recipies = Recipe.all

  def user_logged?
    session[:user_id] != nil
  end

  def logged_user
    user_id = session[:user_id]
    User.find(user_id)
  end

  def logout
    session[:user_id] = nil
    redirect_to :controller => "root", :action => "index"
  end
  
end
