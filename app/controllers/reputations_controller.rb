class ReputationsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @giver = current_user
    @reputation = @user.reputations.build(params[:reputation])
    @reputation.update_attribute('score', 1)
    @reputation.update_attribute('giver', @giver.id)
    if @reputation.save
      @user.reputation = @user.reputation + 1
      @user.save
      render json: { score: @user.reputation }.to_json
    else
      render :nothing => true
    end
  end
end