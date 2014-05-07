class Interest < ActiveRecord::Base
  has_many :users, through: :user_interests
  has_many :user_interests, dependent: :destroy
  attr_accessible :name, :user_id
  validates_presence_of :name
  validates_uniqueness_of :name

  # REVIEW: user user.interested_in?(interest) and remove this.
  def self.relationship_exists(user, interest)
    UserInterest.where('user_id = ? AND interest_id = ?', user.id, interest.id).length > 0
  end

  def sort_users_by_distance(current_user)
    self.users.inject({}) do |by_distance, user|
      by_distance[user] = user.distance(current_user).round(2)
      by_distance
    end.sort_by{ |user, distance| distance }
  end

end
