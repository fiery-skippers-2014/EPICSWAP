require 'spec_helper'

feature 'interest page' do
	let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  before(:each) do
    ApplicationController.any_instance.stub(:current_user) { user }
  end
  scenario 'a logged in user can view an interest page', js: true do
  	visit user_path(user)
    click_on 'Add a Interest'
  	fill_in 'Interest', with: 'basketball'
  	click_link_or_button "Create Interest"
  	fill_in 'Skill', with: 'basketball'
  	click_link_or_button "Create Skill"
  	visit user_path(user)
  	click_on '1'
  	expect(page).to have_content(user.name)
  end
end

