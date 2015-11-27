Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,        ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: 'user'
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end

if Rails.env.development?
  OmniAuth.config.full_host = "https://cfp.magmaconf.dev"
end
