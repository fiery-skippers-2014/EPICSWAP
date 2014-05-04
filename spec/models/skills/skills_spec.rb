require 'spec_helper'

describe Skill do
  context 'associations' do
    it { should have_many(:users) }
    it { should have_many(:user_skills) }
    it { should belong_to(:category) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end