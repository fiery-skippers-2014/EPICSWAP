class InterestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @interest = @user.interests.build(params[:interest])
    if @interest.save
      render partial: 'shared/interest', locals: { interest: @interest }
    else
      render :nothing => true
    end

  end

  def show
    @interest = Interest.find(params[:id])
  end
end