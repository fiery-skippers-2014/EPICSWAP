require 'spec_helper'

describe Reputation do
  context 'associations' do
    it { should belong_to(:user) }
  end
end