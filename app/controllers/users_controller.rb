class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    p params
    @user = User.find(params[:id])
    @skill = Skill.new
    @interest = Interest.new
    @categories = Category.all.collect { |m| [m.name, m.id] }.sort
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

end