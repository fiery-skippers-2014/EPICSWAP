module OmniauthMacros
  require 'spec_helper'
  def mock_auth_hash
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

  OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
      'provider' => 'linkedin',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url',
        'email' => 'mockemail@email.com'
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret',
        'expires_at' => 946688400
      }
    })
  end
end