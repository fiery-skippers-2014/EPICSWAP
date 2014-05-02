module OmniauthMacros
  require 'spec_helper'
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    #https://gist.github.com/kinopyo/1338738
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider' => 'facebook',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url',
        'email' => 'mockemail@email.com'
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret',
        'expires_at' => 5184000
      }
    })
  end
end