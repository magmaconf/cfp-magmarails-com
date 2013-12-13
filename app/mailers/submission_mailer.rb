class SubmissionMailer < ActionMailer::Base
  default from: "info@magmaconf.com"

  def submitted(proposal)
    @proposal = proposal

    mail(to: "info@magmaconf.com", subject: submission_subject)
  end

  def submission_subject
    subject = Rails.env.production? ? "" : "[STAGE] "
    subject << "A new proposal has been submited"
  end
end
