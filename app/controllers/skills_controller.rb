class SkillsController < ApplicationController

  def create
    p params
    @user = User.find(params[:user_id])


    if @user.skills << Skill.new(params[:skill])
      render partial: 'shared/skill', locals: { skill: @user.skills.last.name }
    else
      render :nothing => true
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @skill = Skill.find(params[:id])
    redirect_to user_path(@user)
  end

end