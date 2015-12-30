# == Schema Information
#
# Table name: cfp_comments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  proposal_id :integer
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  notified    :boolean          default(FALSE)
#

require_dependency Cfp::Engine.root.join("app", "models", "cfp", "comment")

Cfp::Comment.class_eval do
  # Do nothing in favor of summary
  def notify_reviewers
    "Not anymore"
  end

  def self.mark_as_notified
    where(notified: false).update_all(notified: true, updated_at: Time.now)
  end
end
