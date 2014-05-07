require 'spec_helper'

describe InterestsController do
  context '#create' do
    let(:user) { FactoryGirl.create :user }
    let(:interest) { FactoryGirl.attributes_for :skill }
    it 'should add a new interest with valid information' do
      expect{
        post :create, user_id: user.id, interest: interest
      }.to change { Interest.count }.by(1)
    end

    it 'should not add new interests with invalid information' do
      expect{
        post :create, user_id: user.id, interest: { name: nil }
      }.to_not change { Interest.count }
    end
  end


  context '#show' do
    let(:interest) {FactoryGirl.create :interest}
    it 'saves an interest found by ID to the instance variable @interest' do
        get :show, id: interest.id
        expect(assigns(:interest)).to eq(interest)
    end
  end

  context '#index' do
    let!(:user) { FactoryGirl.create :user}
    let(:interest) { FactoryGirl.create :interest }
    it 'assigns @interest to all interest' do
      stub_current_user(user)
      get :index
      expect(assigns(:interests)).to eq(Interest.all)
    end
  end
end