class Skill < ActiveRecord::Base
  has_many :users, through: :user_skills
  has_many :user_skills
  belongs_to :category
  attr_accessible :name, :category_id
  validates_presence_of :name

end