class Interest < ActiveRecord::Base
  include SortableByDistance

  has_many :users, through: :user_interests
  has_many :user_interests, dependent: :destroy
  attr_accessible :name, :user_id
  validates_presence_of :name
  validates_uniqueness_of :name

end