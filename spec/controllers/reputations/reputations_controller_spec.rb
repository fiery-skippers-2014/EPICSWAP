require 'spec_helper'

describe ReputationsController do
  let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user}
  before(:each) do
    ApplicationController.any_instance.stub(:current_user) { user }
  end
  context '#create' do
    it 'creates with valid attribute' do
      expect{
        post :create, user_id: second_user.id
        }.to change { Reputation.count }.by(1)
    end
  end
end