class Skill < ActiveRecord::Base
  has_many :users, through: :user_skills
  has_many :user_skills
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

  def save_new_skill_with_category(category_id)
    if self.category_id == nil
     self.update_attribute("category_id", category_id)
    end

  end
end