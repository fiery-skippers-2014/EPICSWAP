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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
       User.geocode(@user)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # GET /usersData.json
  def usersData
    users = User.all
    render json: { users: users }.to_json
  end
end