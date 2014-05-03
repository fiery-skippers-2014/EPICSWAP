class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user       = User.find(params[:id])
    @skill      = Skill.new
    @interest   = Interest.new
    @categories = Category.all.collect { |m| [m.name, m.id] }.sort
    @distance   = @user.distance(current_user).round(2)

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