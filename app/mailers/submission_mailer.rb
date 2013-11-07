class SubmissionMailer < ActionMailer::Base
  default from: "info@magmaconf.com"

  def submitted(proposal)
    @proposal = proposal

    mail(to: "info@magmaconf.com", subject: "A new proposal has been submited")
  end
end
