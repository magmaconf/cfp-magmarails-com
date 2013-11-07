Cfp::Proposal

class Cfp::Proposal < ActiveRecord::Base
  after_create do
    SubmissionMailer.submitted(self).deliver
  end
end
