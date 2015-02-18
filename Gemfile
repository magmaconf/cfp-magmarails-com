source 'https://rubygems.org'

#ruby '2.0.0'

gem 'rails', '4.0.2'

gem 'airbrake', '~> 3.1.6'
gem 'cactu', '~> 0.0.16'
gem 'cfp',
  git: 'git://github.com/crowdint/cfp.git',
  ref: 'ef214590be558fa653c7093156b274730650fb5a'
gem 'devise'
gem 'font-awesome-sass'
gem 'gravtastic'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'newrelic_rpm'
gem 'omniauth'
gem 'omniauth-github'
gem 'will_paginate'
gem 'figaro'

group :development do
  gem 'sqlite3'
  #gem 'pry-debugger'
  gem 'heroku'
  gem 'heroku_pull'
  gem 'quiet_assets'
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
