class AdminsController < ApplicationController
  before_filter :authorize!

  def index
    @users = User.order('name asc')
    redirect_to root_path unless current_user.is_admin?
  end
end