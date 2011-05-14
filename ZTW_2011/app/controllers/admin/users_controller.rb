class Admin::UsersController < ApplicationController
  
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    redirect_to(admin_users_url, :notice => 'User was successfully created.') and return if @user.save
    render :action => "new"
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])  
    redirect_to(admin_users_url, :notice => 'User was successfully updated.') and return if @user.update_attributes(params[:user])
    render :action => "edit"
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(admin_users_url)
  end 
end