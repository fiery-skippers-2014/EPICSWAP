class Interest < ActiveRecord::Base
  has_many :users, through: :user_interests
  has_many :user_interests
  attr_accessible :name, :user_id
  validates_presence_of :name
  validates_uniqueness_of :name

  def self.relationship_exists(user, interest)
    UserInterest.where('user_id = ? AND interest_id = ?', user.id, interest.id).length > 0
  end

  def sort_users_by_distance(current_user)
    users_by_distance = {}
    self.users.each do |user|
      users_by_distance[user] = user.distance(current_user).round(2)
    end
    return users_by_distance.sort_by{ |user, distance| distance }
  end

end