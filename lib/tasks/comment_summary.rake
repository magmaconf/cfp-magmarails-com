namespace :cfp do
  desc "Send the daily email summary"
  task comment_summary: :environment do
    users = User.reviewers
    users.each do |u|
      CommentSummaryMailer.summary(u).deliver
    end
    Cfp::Comment.mark_as_notified
  end
end
