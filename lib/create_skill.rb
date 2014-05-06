module CreateSkill

  def self.call(options)
    skill_name  = options[:skill_name]
    user        = options[:user]
    category_id = option[:category_id]

    skill_name = skill_name.downcase if skill_name != nil

  end

end





# class CreateSkill

#   def self.call options
#     new(options).call
#   end

#   def initialize options
#     @options = options
#   end

#   def call options
#     find_user!
#     valid_skill_name? skill_name
#     update_category!
#     save_skill!
#     return [user, skill, errors]
#   end

#   def find_user!
#     @user = User.find(user_id)
#   end

#   def valid_skill_name? skill_name
#     skill_name = options[:skill_name]
#     raise ActiveRecord::RecordNotFound if skill_name.blank?
#     skill_name = skill_name.downcase if skill_name.present?
#   end

#   def update_category!
#     if skill.category_id == nil && skill.name != nil
#       skill.update_attribute("category_id", params[:skill][:category_id])
#     end
#   end

#   def save_skill!
#     skill.save or errors = 'Skill cannot be blank'
#     if Skill.relationship_exists(user, skill)
#       errors = "You already have #{skill.name} in your skill list"
#     else
#       user.skills << skill
#     end
#   end
# end