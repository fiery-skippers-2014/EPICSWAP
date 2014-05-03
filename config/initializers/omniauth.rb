OmniAuth.config.logger = Rails.logger

Dotenv.load

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_API_KEY'], ENV['FACEBOOK_SECRET']
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
end