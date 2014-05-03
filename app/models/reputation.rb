class Reputation < ActiveRecord::Base
  belongs_to :user
  attr_accessible :score, :user_id
  after_save :update_user_reputation

  def update_user_reputation

  end

end