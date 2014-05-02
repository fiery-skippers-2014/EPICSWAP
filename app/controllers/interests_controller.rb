class InterestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @interest = @user.interests.build(params[:interest])
    if @interest.save
      redirect_to user_path(@user)
    else
      render :nothing => true
    end

  end
end