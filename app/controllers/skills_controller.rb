class SkillsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    skill_name = params[:skill][:name]
    skill_name.downcase! if skill_name != nil
    @skill = Skill.find_or_create_by_name(skill_name)

    if @skill.category_id == nil && @skill.name != nil
      @skill.update_attribute("category_id", params[:skill][:category_id])
    end

    if @skill.save
      if Skill.relationship_exists(@user, @skill)
        @errors = "You already have #{@skill.name} in your skill list"
        render partial: 'shared/errors', locals: {errors: @errors}
      else
        @user.skills << @skill
        render partial: 'shared/skill', locals: { skill: @skill }
      end

    else
      @errors = 'Skill cannot be blank'
      render partial: 'shared/errors', locals: {errors: @errors}
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

  def autocomplete
    word = params.keys.first.downcase
    word = "#{word}%"
    @words = Skill.where("name like ?", word)
    render partial: 'shared/autocomplete', locals: { words: @words }
  end
end