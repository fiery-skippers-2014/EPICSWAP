require 'spec_helper'

feature 'interest page' do
	let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  before(:each) do
    ApplicationController.any_instance.stub(:current_user) { user }
  end
  scenario 'a logged in user can view an interest page' do
  	visit user_path(user)
  	fill_in 'Interest', with: 'basketball'
  	click_button "Create Interest"
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

