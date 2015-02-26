class Contact < ActionMailer::Base
  default from: "info@magmaconf.com"

  def send_mail name, company, email
    @name = name
    @email = email
    @company = company

    mail(from: email, subject: 'Sponsor inquiry')
  end


end
