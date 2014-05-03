class ReputationsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @reputation = user.reputations.build(params[:reputation])
    if @reputation.save
      @reputation.score.to_json
    else
      render :nothing => true
    end
  end
end