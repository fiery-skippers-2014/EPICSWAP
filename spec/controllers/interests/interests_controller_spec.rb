require 'spec_helper'

describe InterestsController do
  context '#create' do
    let(:user) { FactoryGirl.create :user }
    let(:interest) { FactoryGirl.attributes_for :skill }
    it 'should add a new interest with valid information' do
      expect{
        post :create, user_id: user.id, interest: interest
      }.to change { Interest.count }.by(1)
      expect(response).to be_redirect
    end
  end
end