class InterestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @interest = Interest.new(params[:interest])
    if @interest.save
      @user.interests << @interest
      render partial: 'shared/interest', locals: { interest: @interest }
    else
      render :nothing => true
    end

  end

  def show
    @interest = Interest.find(params[:id])
  end
end