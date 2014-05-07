module SortableByDistance
  def sort_users_by_distance(current_user)
    users_by_distance = {}
    self.users.each do |user|
      users_by_distance[user] = user.distance(current_user).round(2)
    end
    return users_by_distance.sort_by{ |user, distance| distance }
  end
end