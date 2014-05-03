class ReputationsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @reputation = @user.reputations.build(params[:reputation])
    @reputation.update_attribute('score', 1)
    if @reputation.save
      @user.reputation = @user.reputation + 1
      @user.save
      render json: { score: @user.reputation }.to_json
    else
      render :nothing => true
    end
  end
end