class ReputationsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @reputation = user.reputations.build(params[:reputation])
    if @reputation.save
      redirect_to user_path(@user)
    else
      render :nothing => true
    end
  end
end