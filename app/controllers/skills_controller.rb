class SkillsController < ApplicationController
  before_filter :authorize!
  def index
    @skills = Skill.order('name asc')
  end

  def create
    skill_name = params[:skill][:name]
    category = Category.find params[:skill][:category_id]
    @skill = Skill.find_or_initialize_by_name(skill_name.try(:downcase))
    @skill.category = category unless @skill.category.present?

    if @skill.save
      if current_user.already_skilled_in?(@skill)
        @errors = "You already have #{@skill.name} in your skill list"
        render partial: 'shared/errors', locals: {errors: @errors}, :status => :unproccessable_entity
      else
        current_user.skills << @skill
        render partial: 'skills/skill', locals: { skill: @skill }
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