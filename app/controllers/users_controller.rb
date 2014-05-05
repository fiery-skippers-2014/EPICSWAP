class UsersController < ApplicationController

  def index
    render :welcome, layout: false unless current_user
    @users = User.all
  end

  def show

    @user       = User.find(params[:id])
    @skill      = Skill.new
    @interest   = Interest.new
    @categories = Category.all.collect { |m| [m.name, m.id] }.sort
    @distance   = @user.distance(current_user).round(2) if current_user
    @reputation = Reputation.new
    render 'initial' if current_user.street == nil
    redirect_to root_path unless current_user
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
       User.geocode(@user)
       render json: { user: @user }.to_json
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  # GET /usersData.json
  def usersData
    render json: { users: User.all_with_skills }.to_json
  end
end