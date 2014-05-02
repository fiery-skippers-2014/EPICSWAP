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

  def update
    @user = User.find(params[:id])
    p params[:user]
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render :edit
    end


  end

end