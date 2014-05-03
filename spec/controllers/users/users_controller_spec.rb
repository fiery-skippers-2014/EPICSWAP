require 'spec_helper'

describe UsersController do
  let!(:user) { FactoryGirl.create :user }
  let!(:valid) { FactoryGirl.attributes_for :user}
  before(:each) do
    ApplicationController.any_instance.stub(:current_user) { user }
  end

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

    it 'should assign @skill to Skill.new' do
      get :show, id: user.id
      expect(assigns(:skill)).to be_a_new Skill
    end
  end

  context '#edit' do
    it 'should assign @user to User.find(user)' do
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
    end

    it 'should render the users edit profile page' do
      get :edit, id: user.id
      expect(response).to be_success
    end
  end

  context '#update' do
    before(:each) do
      Location.should_receive(:geocode) {[37.8010187, -122.412323]}
    end

    it 'should update attributes with valid information' do
      expect{
        post :update, id: user.id, user: { tagline: 'new tagline' }
        }.to change { user.reload.tagline }.to('new tagline')
      expect(response).to be_redirect
    end

    it 'should set the latitude and longitude on update' do
      expect{
        post :update, id: user.id, user: { street: '759 Filbert', city: 'San Francisco', state: 'CA' }
        }.to change { user.reload.latitude }.to(37.8010187)
    end
  end

  context "#destroy" do

    let!(:user) { FactoryGirl.create :user }
    it "destroys the record" do
      expect {
        delete :destroy, :id => user.id
      }.to change { User.count }.by (-1)
    end
  end
end

