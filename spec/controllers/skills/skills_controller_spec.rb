require 'spec_helper'

describe SkillsController do

  context '#create' do
    let!(:user) { FactoryGirl.create :user }
    let!(:skill) { FactoryGirl.attributes_for :skill }
    it 'adds a skill with valid information' do
      expect{
        post :create, user_id: user.id, skill: skill
        }.to change { Skill.count }.by(1)
    end

    it 'should not add new skills with invalid information' do
      expect{
        post :create, user_id: user.id, skill: { name: nil }
      }.to_not change { Skill.count }
    end
  end

  context '#destroy' do #ask Shadi
    let!(:user) { FactoryGirl.create :user_with_skill}
    let(:skill) { user.skills.first }
    it 'deletes a skill' do
      stub_current_user(user)
      expect{
        delete :destroy, :id => skill
      }.to change { UserSkill.count }.by(-1)
      expect(user.reload.skills).to_not include(skill)
    end
  end
end