class UsersController < ApplicationController

  # GET /user
  def show
    if (user_logged?)
      @user = logged_user
    else redirect_to root_url
    end
  end

  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/edit
  def edit
    if (user_logged?)
      @user = logged_user
    else redirect_to root_url
    end
  end

  # POST /user
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to(user_url, :notice => 'User was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /user
  def update
    @user = logged_user
    if @user.update_attributes(params[:user])
      redirect_to(@user, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /user
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session_reset
    redirect_to root_url
  end 
end