require 'spec_helper'

describe Skill do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end
end