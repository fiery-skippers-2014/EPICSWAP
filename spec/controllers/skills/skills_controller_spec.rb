require 'spec_helper'

describe SkillsController do

  context '#create' do
    let(:user) { FactoryGirl.create :user }
    let(:skill) { FactoryGirl.attributes_for :skill }
    it 'adds a skill with valid information' do
      expect{
        post :create, user_id: user.id, skill: skill
        }.to change { Skill.count }.by(1)
    end
  end
end