class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  def self.delete_relationship(user_id, skill_id)
  	relationship = UserSkill.where('user_id = ? AND skill_id = ?', user_id, skill_id)
  	UserSkill.destroy(relationship.first.id)
  end
end