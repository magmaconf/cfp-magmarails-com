class Cfp::Proposal < ActiveRecord::Base
  after_create do
    SubmissionMailer.submitted(self).deliver
  end

  def self.pending_titles
    where(approved: false).collect { |p| [p.id, p.title] }
  end

  def self.update_all_pending
    update_all(approved: true)
  end
end
