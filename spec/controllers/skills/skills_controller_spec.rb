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

  # context '#destroy' do
  #   let!(:skill) { FactoryGirl.create :skill }
  #   it 'deletes a skill' do
  #     expect{
  #       delete :destroy, user_id: user.id, id: skill.id
  #     }.to change { UserSkill.count }.by(-1)
  #   end
  # end
end