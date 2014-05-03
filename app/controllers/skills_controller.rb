class SkillsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @skill = @user.skills.build(params[:skill])
    if @skill.save
      render partial: 'shared/skill', locals: { skill: @skill }
    else
      render :nothing => true
    end
  end
end