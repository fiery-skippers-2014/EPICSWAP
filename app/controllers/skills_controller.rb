class SkillsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @skill = Skill.find_or_create_by_name_and_category_id(params[:skill])
    if @skill.save
      @user.skills << @skill unless Skill.relationship_exists(@user, @skill)
      render partial: 'shared/skill', locals: { skill: @skill }
    else
      render :nothing => true
    end
  end

  def show
    @skill = Skill.find(params[:id])
    redirect_to user_path(@user)
  end

  def destroy
    UserSkill.delete_relationship(current_user.id, params[:id])
    render :nothing => true
  end
end