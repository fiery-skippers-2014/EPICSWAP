class SkillsController < ApplicationController

  def index
    @skills = Skill.order('name asc')
  end

  def create
    @user = User.find(params[:user_id])
    skill_name = params[:skill][:name]
    skill_name = skill_name.downcase unless skill_name.nil?
    category_id = params[:skill][:category_id]
    @skill = Skill.find_or_create_by_name(skill_name)

    if @skill.category_id.nil? && @skill.name != nil
      @skill.update_attribute("category_id", category_id)
    end

    if @skill.save
      if @user.already_skilled_in?(@skill)
        @errors = "You already have #{@skill.name} in your skill list"
        render partial: 'shared/errors', locals: {errors: @errors}, :status => :unproccessable_entity
      else
        @user.skills << @skill
        render partial: 'shared/skill', locals: { skill: @skill }
      end
    else
      @errors = 'Skill cannot be blank'
      render partial: 'shared/errors', locals: {errors: @errors}, :status => :unproccessable_entity
    end
  end

  def show
    @skill = Skill.find(params[:id])
    @sorted_users = @skill.sort_users_by_distance(current_user)
  end

  def destroy
    skill = Skill.find(params[:id])
    current_user.skills.delete(skill)
    render :nothing => true
  end

  def autocomplete
    word = params.keys.first.downcase
    word = "%#{word}%"
    @words = Skill.where("name like ?", word)
    render partial: 'shared/autocomplete', locals: { words: @words }
  end
end