class Contact < ActionMailer::Base
  default from: "no-reply@magmaconf.com"
  default to: ENV["CFP_CONTACT_EMAIL"]

  def send_mail name, company, email
    @name = name
    @email = email
    @company = company

    mail(subject: 'Sponsor inquiry')
  end


end
