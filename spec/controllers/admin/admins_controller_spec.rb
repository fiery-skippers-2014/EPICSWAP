require 'spec_helper'

describe AdminsController do
  let!(:user) { FactoryGirl.create :user }
  context '#index' do
    it 'should redirect a non admin' do
      stub_current_user(user)
      get :index
      expect(response).to be_redirect
    end

    it 'should assign @users to all users sorted by name' do
      stub_current_user(user)
      User.any_instance.stub(:is_admin?) { true }
      get :index
      expect(assigns(:users)).to eq(User.order('name asc'))
    end
  end
end