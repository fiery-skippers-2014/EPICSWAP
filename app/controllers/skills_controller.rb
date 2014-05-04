class SkillsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @skill = Skill.new(params[:skill])

    if @skill.save
      @user.skills << @skill
      render partial: 'shared/skill', locals: { skill: @skill }
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