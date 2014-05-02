require 'spec_helper'

describe User do
  context 'associations' do
    it { should have_many(:skills) }
    it { should have_many(:interests) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end