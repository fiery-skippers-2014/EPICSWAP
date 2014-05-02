require 'spec_helper'

describe Interest do
  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    it {should validate_presence_of(:name) }
  end
end