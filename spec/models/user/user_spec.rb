require 'spec_helper'

describe User do
  context 'associations' do
    it { should have_many(:skills) }
    it { should have_many(:interests) }
  end
end