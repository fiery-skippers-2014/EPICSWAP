require 'spec_helper'

# in spec/requests/top_spec.rb
describe "access users page" do
  it "can sign in user with Facebook account" do
    visit '/'
    mock_auth_hash
    page.find_by_id('facebook_button').click
    expect(page).to have_content("mockuser")  # user name
    expect(page).to have_content("Sign out")
  end

  it "can handle authentication error" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit '/'
    page.find_by_id('facebook_button').click
    expect(page).to have_content('Login')
    expect(current_path).to eq root_path
  end

end

describe "access Linked in users page" do
  it "can sign in user with Linked In account" do
    visit "/"
    mock_auth_hash
    page.find_by_id('linkedin_button').click
    expect(page).to have_content("mockuser")
    expect(page).to have_content("Sign out")
  end

   it "can handle authentication error" do
    OmniAuth.config.mock_auth[:linkedin] = :invalid_credentials
    visit '/'
    page.find_by_id('linkedin_button').click
    expect(page).to have_content('Login')
    expect(current_path).to eq root_path
  end

end