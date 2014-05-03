module ApplicationHelper

  def reputation_given?(current_user, user)
    Reputation.where('user_id = ? AND giver = ?', user.id, current_user.id).length > 0
  end
end
