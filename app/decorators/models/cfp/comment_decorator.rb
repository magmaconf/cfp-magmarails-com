Cfp::Comment.class_eval do
  # Do nothing in favor of summary
  def notify_reviewers
    "Not anymore"
  end

  def self.mark_as_notified
    where(notified: false).update_all(notified: true, updated_at: Time.now)
  end
end
