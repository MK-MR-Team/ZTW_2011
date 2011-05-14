class RootController < ApplicationController
  def index
  end

  def kontakt
  end

  def forbidden
  end

  def login
    @errors = Hash.new
    if request.post? then
      login = params[:login]
      password = params[:password]
      if !login.blank? && !password.blank? then
        user = User.find_by_login_and_password(login, password)
        if (user.nil?) then @errors[:user] = "Incorrect credentials."
        else
          session[:user_id] = user.id
          redirect_to :controller => "root", :action => "index"
        end
      else #login or password blank
        if login.blank? then @errors[:login] = "Login must be specified." end
        if password.blank? then @errors[:password] = "Password must be specified."end
      end
    end
  end

end
