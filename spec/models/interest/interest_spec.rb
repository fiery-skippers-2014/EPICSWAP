require 'spec_helper'

describe Interest do
  context 'associations' do
    it { should have_many(:users) }
    it { should have_many(:user_interests) }
  end

  context 'validations' do
    it {should validate_presence_of(:name) }
    it {should validate_uniqueness_of(:name)}
  end
end