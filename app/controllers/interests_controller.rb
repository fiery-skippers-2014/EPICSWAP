class InterestsController < ApplicationController
  def create
    p params[:interest][:name]
    @user = User.find(params[:user_id])
    @interest = Interest.find_or_create_by_name(params[:interest][:name])
    p @interest
    if @interest.save
      p 'saved'
      @user.interests << @interest unless Interest.relationship_exists(@user, @interest)
      render partial: 'shared/interest', locals: { interest: @interest }
    else
      p 'failed'
      render :nothing => true
    end

  end

  def show
    @interest = Interest.find(params[:id])
  end

  def destroy
    UserInterest.delete_relationship(current_user.id, params[:id])
    render :nothing => true
  end
end