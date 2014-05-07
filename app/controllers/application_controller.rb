class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  helper_method :current_user
end
