require 'spec_helper'

describe Skill do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end