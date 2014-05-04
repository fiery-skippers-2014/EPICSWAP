class Skill < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :name, :category_id
  validates_presence_of :name

  def skill_cooresponding_interest
    Interest.where('name = ?', self.name).uniq
  end
end