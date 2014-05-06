class UsersController < ApplicationController

  def index
    render :welcome, layout: false unless signed_in?
    @categories = Category.all
    @users = User.all
  end

  def show
    redirect_to root_path unless signed_in?
    @user       = User.find(params[:id])
    @skill      = Skill.new
    @interest   = Interest.new
    @categories = Category.all.collect { |m| [m.name, m.id] }.sort
    @distance   = @user.distance(current_user).round(2) if signed_in?
    @reputation = Reputation.new
    render 'first_time_user' if signed_in? && current_user.missing_address?
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
    reset_session
    redirect_to root_path
  end


  def usersData
    render json: { users: User.all_with_skills, current_user: current_user }.to_json
  end
end