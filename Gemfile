source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'airbrake', '~> 3.1.6'
gem 'cactu', '~> 0.0.16'
gem 'cfp', git: 'git://github.com/crowdint/cfp.git'
gem 'devise'
gem 'font-awesome-sass'
gem 'gravtastic'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'newrelic_rpm'
gem 'omniauth'
gem 'omniauth-github'
gem 'rails_12factor'
gem 'will_paginate'

group :development do
  gem 'sqlite3'
  gem 'pry-debugger'
  gem 'heroku'
  gem 'heroku_pull'
end

group :production, :stage do
  gem 'pg'
  gem 'rails_12factor'
  gem 'thin'
end

group :assets do
  gem 'coffee-rails', '~> 4.0.0'
  gem 'sass-rails',   '~> 4.0.0'
  gem 'uglifier', '>= 1.0.3'
end
