class Cfp::Proposal < ActiveRecord::Base
  after_create do
    SubmissionMailer.submitted(self).deliver
  end

  def self.pending_titles
    where(approved: false).collect { |p| [p.id, p.title] }
  end
end
