module ApplicationHelper

  def reputation_given?(current_user, user)
    Reputation.where('user_id = ? AND giver = ?', user.id, current_user.id).length > 0
  end

  def num_users_by_interests(skill)
   interested_users = User.joins(:interests).where('interests.name = ?', skill).uniq.length
  end


  def corresponding_interest(skill)
    interest = Interest.where('name = ?', skill).first
  end


  def num_users_by_skills(interest)
   skilled_users = User.joins(:skills).where('skills.name = ?', interest).uniq.length
  end

  def corresponding_skill(interest)
    skill = Skill.where('name = ?', interest).first
  end

  def sort_users_by_distance(current_user, skill)
    users_by_distance = {}
    skill.users.each do |user|
      users_by_distance[user] = user.distance(current_user).round(2)
    end
    return users_by_distance.sort_by{ |user, distance| distance }
  end

end
