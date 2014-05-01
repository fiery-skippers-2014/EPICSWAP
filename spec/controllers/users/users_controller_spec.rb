require 'spec_helper'

describe UsersController do
  let!(:user) { FactoryGirl.create :user }

  context '#index' do
    it 'should return the homepage' do
      get :index
      expect(response).to be_success
    end
    it 'should assign @users to User.all' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end

  context '#show' do
    it 'should render the users profile' do
      get :show, id: user.id
      expect(response).to be_success
    end

    it 'should assign @user to User.find(user)' do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end
end
