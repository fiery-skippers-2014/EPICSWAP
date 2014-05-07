require 'spec_helper'

describe StaticPagesController do
  context '#privacy' do
    it 'should display the privacy page' do
      get :privacy
      expect(response).to be_success
    end
  end
end