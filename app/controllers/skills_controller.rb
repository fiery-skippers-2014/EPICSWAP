class SkillsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    skill_name = params[:skill][:name]
    category_id = params[:skill][:category_id]
    # CreateSkill.call({skill_name: skill_name, user: @user, category_id: category_id})

    skill_name = skill_name.downcase unless skill_name.nil?
    @skill = Skill.find_or_create_by_name(skill_name)

    @skill.update_category(category_id)

    if @skill.save
      if Skill.relationship_exists(@user, @skill)
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