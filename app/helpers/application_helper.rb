module ApplicationHelper

  def reputation_given?(current_user, user)
    Reputation.where('user_id = ? and giver = ?', user, current_user).length == 1
  end
end
