class SkillsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @skill = @user.skills.build(params[:skill])
    if @skill.save
      redirect_to user_path(@user)
    else
      render :nothing => true
    end

  end

end