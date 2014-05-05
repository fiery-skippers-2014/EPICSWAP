class Skill < ActiveRecord::Base
  has_many :users, through: :user_skills
  has_many :user_skills, dependent: :destroy
  belongs_to :category
  attr_accessible :name, :category_id
  validates_presence_of :name
  validates_uniqueness_of :name

  def skill_cooresponding_interest
    Interest.where('name = ?', self.name).uniq
  end

  def self.relationship_exists(user, skill)
    UserSkill.where('user_id = ? AND skill_id = ?', user.id, skill.id).length > 0
  end


  def sort_users_by_distance(current_user)
    users_by_distance = {}
    self.users.each do |user|
      users_by_distance[user] = user.distance(current_user).round(2)
    end
    return users_by_distance.sort_by{ |user, distance| distance }
  end

end