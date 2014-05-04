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
end