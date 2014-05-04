class InterestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @interest = Interest.find_or_create_by_name(params[:interest][:name])
    if @interest.save
      if Interest.relationship_exists(@user, @interest)
        @errors = "You already have #{@interest.name} in your interest list"
        render partial: 'shared/errors', locals: {errors: @errors}
      else
        @user.interests << @interest
        render partial: 'shared/interest', locals: { interest: @interest }
      end
    else
      @errors = 'Interest cannot be blank'
      render partial: 'shared/errors', locals: {errors: @errors}
    end

  end

  def show
    @interest = Interest.find(params[:id])
    @sorted_users = @interest.sort_users_by_distance(current_user)
  end

  def destroy
    UserInterest.delete_relationship(current_user.id, params[:id])
    render :nothing => true
  end
end