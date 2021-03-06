require 'spec_helper'

feature 'view a user profile' do
  let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  before(:each) do
    stub_current_user(user)
  end
  scenario 'a logged in user can view their profile page' do
    visit root_path
    click_on user.name
    expect(page).to have_content(user.tagline)
  end

  scenario 'a logged in user can view another persons profile' do
    visit user_path(second_user)
    expect(page).to have_content(second_user.name)
  end

  scenario 'a logged in user can see the distance from another user' do
    visit user_path(second_user)
    expect(page).to have_content('miles away')
  end

  scenario 'a logged in user can email another user' do
    visit user_path(second_user)
    expect(page).to have_content("Email")
  end

  scenario 'a logged in user can give reputation to another user' do
    visit user_path(second_user)
    expect(page).to have_content("+1")
  end

  scenario 'a user cannot give reputation to the same user twice' do
    visit user_path(second_user)
    click_on '+1'
    expect(page).to_not have_content('+1')
  end
end

feature 'non logged in user' do
  let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  scenario 'cannot view a profile page' do
    visit user_path(second_user)
    expect(page).to have_content('Login')
  end

  scenario 'cannot view an edit profile page' do
    visit edit_user_path(second_user)
    expect(page).to have_content('Login')
  end
end

feature 'skills on the user profile' do
  before(:each) do
    stub_current_user(user)
  end
  let!(:user) { FactoryGirl.create :user }
  scenario 'a user can add skills they can teach', js: true do
    visit user_path(user)
    click_on 'Add a Skill'
    fill_in 'Skill', :with => 'basketball'
    click_on 'Add Skill'
    expect(page).to have_content 'My Skills'
    expect(page).to have_content 'basketball'
  end

  scenario 'a user cannot add more than 3 skills', js: true do
    visit user_path(user)
    click_on 'Add a Skill'
    fill_in 'Skill', :with => 'basketball'
    click_on 'Add Skill'
    visit user_path(user)
    click_on 'Add a Skill'
    fill_in 'Skill', :with => 'soccer'
    click_on 'Add Skill'
    visit user_path(user)
    click_on 'Add a Skill'
    fill_in 'Skill', :with => 'football'
    click_on 'Add Skill'
    visit user_path(user)
    expect(page).to have_content('maximum')
  end

  scenario 'a user can delete skills', js: true do
    visit user_path(user)
    click_on 'Add a Skill'
    fill_in 'Skill', :with => 'basketball'
    click_on 'Add Skill'
    visit user_path(user)
    click_on 'delete'
    expect(page).to_not have_content('basketball')
  end
end

feature 'interests on the user profile' do
  let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  before(:each) do
    stub_current_user(user)
  end

  scenario 'a user can add interests they can teach', js: true  do
    visit user_path(user)
    click_on 'Add an Interest'
    fill_in 'Interest', :with => 'white water rafting'
    click_link_or_button "Add Interest"
    expect(page).to have_content 'My Interests'
    expect(page).to have_content 'white water rafting'
  end


  scenario 'a user can delete interests', js: true do
    visit user_path(user)
    click_on 'Add an Interest'
    fill_in 'Interest', :with => 'basketball'
    click_link_or_button "Add Interest"
    visit root_path
    visit user_path(user)
    click_on 'delete'
    expect(page).to_not have_content('basketball')
  end

  scenario 'a user who is not the current user cannot add skills' do
    visit user_path(second_user)
    expect(page).to_not have_content('Add Skill')
  end

  scenario 'a user who is not the current user cannot add interest' do
    visit user_path(second_user)
    expect(page).to_not have_content('Add Interest')
  end
end

feature 'edit profile' do
  let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }

  before(:each) do
    stub_current_user(user)
  end

  scenario 'a logged in user can edit' do
    Location.should_receive(:geocode) {[37.8010187, -122.412323]}
    visit user_path(user)
    expect(page).to have_content('Edit Profile')
    click_on 'Edit Profile'
    fill_in 'Tagline', with: 'new tagline'
    click_on 'Update User'
    expect(page).to have_content('new tagline')
  end

  scenario 'a user who is not the current user does not see edit profile link' do
    visit user_path(second_user)
    expect(page).to_not have_content('Edit Profile')
  end
end

feature 'delete profile' do
  let!(:user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }

  before(:each) do
    stub_current_user(user)
  end
  scenario 'a logged in user can delete their profile' do
    visit user_path(user)
    expect(page).to have_content('Delete Profile')
  end

  scenario ' a user who is not the current user does see delete profile' do
    visit user_path(second_user)
    expect(page).to_not have_content('Delete Profile')
  end

end