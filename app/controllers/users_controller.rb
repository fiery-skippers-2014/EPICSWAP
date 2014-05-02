class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def delete
    user = User.find(params[:id])
    user.destroy
    redirect to '/'
  end

end