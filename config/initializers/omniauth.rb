Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['CFP_APP_ID'], ENV['CFP_APP_SECRET']
end

if Rails.env.development?
  OmniAuth.config.full_host = "https://cfp.magmaconf.dev"
end
