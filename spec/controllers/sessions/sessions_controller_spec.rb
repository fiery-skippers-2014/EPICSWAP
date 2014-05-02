require 'spec_helper'

describe SessionsController do
  # context 'CREATE' do
  #   let!(:user){FactoryGirl.create :user}
  #     it 'creates a user' do
  #      expect {
  #       post :create
  #      }.to change {User.count}.by(1)
  #     end
  # end
  context "DELETE 'destroy'" do
    let!(:user){FactoryGirl.create :user}
      it "destroys the user" do
        expect {
          delete :destroy, id: user.id
        }.to change {User.count}.by(-1)
    end
  end








 end