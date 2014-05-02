require 'spec_helper'

feature 'view a user profile' do
  let!(:user) { FactoryGirl.create :user }
  before(:each) do
    ApplicationController.any_instance.stub(:current_user) { user }
  end
  scenario 'a logged in user can view their profile page' do
    visit root_path
    click_on user.name
    expect(page).to have_content(user.tagline)
  end
end

feature 'add skills on the user profile' do
  let!(:user) { FactoryGirl.create :user }
  scenario 'a user can add skills they can teach' do
    visit user_path(user)
    fill_in 'Skill', :with => 'basketball'
    click_on 'Create Skill'
    expect(page).to have_content 'My Skills'
    expect(page).to have_content 'basketball'
  end
end

feature 'add interests on the user profile' do
  let!(:user) { FactoryGirl.create :user }
  scenario 'a user can add interests they can teach' do
    visit user_path(user)
    fill_in 'Interest', :with => 'white water rafting'
    click_on 'Create Interest'
    expect(page).to have_content 'My Interests'
    expect(page).to have_content 'white water rafting'
  end
end