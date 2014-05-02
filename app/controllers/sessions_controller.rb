class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    result = request.location
    p result.data['latitude']

    if user.latitude == nil && user.longitude == nil
      user.latitude = result.data['latitude']
      user.longitude = result.data['longitude']
    end
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end