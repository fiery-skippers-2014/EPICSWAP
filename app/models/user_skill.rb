class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  validates_uniqueness_of :skill_id, :scope => :user_id

  def self.delete_relationship(user_id, skill_id)
  	relationship = UserSkill.where('user_id = ? AND skill_id = ?', user_id, skill_id)
  	UserSkill.destroy(relationship.first.id)
  end

  def self.less_than_max?(user)
    UserSkill.where('user_id = ?', user.id).length < 3
  end
end