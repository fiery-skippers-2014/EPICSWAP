class Interest < ActiveRecord::Base
  has_many :users, through: :user_interests
  has_many :user_interests
  attr_accessible :name, :user_id
  validates_presence_of :name
  validates_uniqueness_of :name

  def self.relationship_exists(user, interest)
    UserInterest.where('user_id = ? AND interest_id = ?', user.id, interest.id).length > 1
  end

end