require 'spec_helper'

describe UsersController do
  let!(:user) { FactoryGirl.create :user }
  let!(:valid) { FactoryGirl.attributes_for :user}

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
    it 'should update attributes with valid information' do
      expect{
        post :update, id: user.id, user: { tagline: 'new tagline' }
        }.to change { user.reload.tagline }.to('new tagline')
      expect(response).to be_redirect
    end

    it 'should set the latitude and longitude on update' do
      Location.should_receive(:geocode) {[37.8010187, -122.412323]}
      expect{
        post :update, id: user.id, user: { street: '759 Filbert', city: 'San Francisco', state: 'CA' }
        }.to change { user.reload.latitude }.to(37.8010187)
    end

    # it 'should not update attributes with invalid information' do
    #   expect{
    #     post :update, id: user.id, user: { street: nil }
    #     }.to_not change { user.reload.street }
    #   expect(response).not_to be_redirect
    # end


  context "#destroy" do
    let!(:user) { FactoryGirl.create :user }
    it "destroys the record" do
      expect {
        delete :destroy, :id => user.id
      }.to change { User.count }.by (-1)
    end
  end


  context '#create' do
    let!(:user){FactoryGirl.create :user}
      it 'creates a user' do
       expect {
        post :create
       }.to change {User.count}.by(1)
      end
  end


  end
end
