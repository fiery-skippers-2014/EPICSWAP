class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    result = request.location

    user.update_long_and_lat result.data

    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end
