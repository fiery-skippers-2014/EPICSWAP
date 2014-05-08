class Skill < ActiveRecord::Base
  include SortableByDistance

  has_many :users, through: :user_skills
  has_many :user_skills, dependent: :destroy
  belongs_to :category
  attr_accessible :name, :category_id
  validates :name, :presence => true, :uniqueness => true

  def skill_cooresponding_interest
    Interest.where('name = ?', self.name).uniq
  end
end