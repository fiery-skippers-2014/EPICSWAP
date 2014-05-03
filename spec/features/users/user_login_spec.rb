require 'spec_helper'

# in spec/requests/top_spec.rb
describe "access users page" do
  it "can sign in user with Facebook account" do
    visit '/'
    page.should have_content("Sign in with Facebook")
    mock_auth_hash
    click_link "Sign in with Facebook"
    expect(page).to have_content("mockuser")  # user name
    expect(page).to have_content("Sign out")
  end

  it "can handle authentication error" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit '/'
    page.should have_content("Sign in with Facebook")
    click_link "Sign in with Facebook"
    expect(page).to have_content('Sign in with Facebook')
    expect(current_path).to eq root_path
  end

end

describe "access Linked in users page" do
  it "can sign in user with Linked In account" do
    visit "/"
    page.should have_content("Sign in with Linked In")
    mock_auth_hash
    click_link "Sign in with Linked In"
    expect(page).to have_content("mockuser")
    expect(page).to have_content("Sign out")
  end

   it "can handle authentication error" do
    OmniAuth.config.mock_auth[:linkedin] = :invalid_credentials
    visit '/'
    page.should have_content("Sign in with Linked In")
    click_link "Sign in with Linked In"
    expect(page).to have_content('Sign in with Linked In')
    expect(current_path).to eq root_path
  end

end