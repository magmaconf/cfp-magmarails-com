ActionMailer::Base.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
}

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.default_url_options[:host] = 'cfp.magmaconf.com'
