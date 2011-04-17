class LoginController < ApplicationController
  
  def index
    @errors = Hash.new
  end

  def login
    login = params[:login]
    password = params[:password]
    @errors = Hash.new
    if !login.blank? && !password.blank? then
      user = User.find_by_login_and_password(login, password)
      if (user.nil?) then
        @errors[:user] = "Incorrect credentials."
      else
        session[:user_id] = user.id
      end
    else
      if login.blank? then
        @errors[:login] = "Login must be specified."
      end
      if password.blank? then
        @errors[:password] = "Password must be specified."
      end
    end
    render :index

  end

end