require 'spec_helper'

feature 'interest page' do
	let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  before(:each) do
    ApplicationController.any_instance.stub(:current_user) { user }
  end
  scenario 'a logged in user can view an interest page' do
  	visit user_path(user)
    click_on 'Add a Interest'
  	fill_in 'Interest', with: 'basketball'
  	click_link_or_button "Create Interest"
  	fill_in 'Skill', with: 'basketball'
  	click_link_or_button "Create Skill"
  	visit user_path(user)
  	expect(page).to have_content(user.name)
  end

  scenario 'a logged in user can view a skill page' do
    visit user_path(user)
    fill_in 'Skill', with: 'soccer'
    click_on "Create Skill"
    visit user_path(user)
    expect(page).to have_content(user.name)
  end
end

