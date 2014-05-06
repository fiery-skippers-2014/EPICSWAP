module ApplicationHelper

  def reputation_given?(current_user, user)
    Reputation.where('user_id = ? AND giver = ?', user.id, current_user.id).length > 0
  end

  def num_users_by_interests(skill)
   interested_users = User.joins(:interests).where('interests.name = ?', skill).uniq.length
  end

  def find_users_by_interest(skill)
   @interested_users = User.joins(:interests).where('interests.name = ?', skill).uniq
  end

  def corresponding_interest(skill)
    interest = Interest.where('name = ?', skill).first
  end


  #####

  def num_users_by_skills(interest)
   skilled_users = User.joins(:skills).where('skills.name = ?', interest).uniq.length
  end

  def find_users_by_skill(interest)
   @skilled_users = User.joins(:skills).where('skills.name = ?', interest).uniq
  end

  def corresponding_skill(interest)
    skill = Skill.where('name = ?', interest).first
  end

end
