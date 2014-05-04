require 'spec_helper'

describe 'Interests' , :js => true do

let!(:user) {FactoryGirl.create :user}
let!(:interest) {FactoryGirl.create :interest,  :user => user}
# url = 'interests/21'
context 'interest show page' do
  it 'lists all users that have that interest' do
    visit interest_path(interest)
    expect(page).to have_content user.name
  end
 end
end