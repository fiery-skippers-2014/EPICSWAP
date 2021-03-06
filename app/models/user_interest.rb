class UserInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest

  def self.delete_relationship(user_id, interest_id)
  	relationship = UserInterest.where('user_id = ? AND interest_id = ?', user_id, interest_id)
  	UserInterest.destroy(relationship.first.id)
  end

end