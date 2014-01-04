namespace :cfp do
  desc "Send the daily email summary"
  task comment_summary: :environment do
    users = User.reviewers
    users.each do |u|
      puts "Will send email to #{u.profile.email}..."
      CommentSummaryMailer.summary(u).deliver
    end
  end
end
