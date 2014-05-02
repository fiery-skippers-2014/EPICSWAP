class Skill < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :name, :category_id
  validates_presence_of :name

end