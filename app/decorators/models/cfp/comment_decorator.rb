class Cfp::Comment < ActiveRecord::Base
  # Do nothing in favor of summary
  def notify_reviewers
    "Not anymore"
  end
end
