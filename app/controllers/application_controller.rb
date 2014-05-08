class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

  def authorize!
    redirect_to root_path, :notice => "you must be signed in" unless signed_in?
  end
  helper_method :current_user
end
