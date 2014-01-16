require 'csv'

namespace :cfp do
  task csv: :environment do
    CSV.open("rank.csv", "wb") do |csv|
      Cfp::Proposal.ranked_and_sorted.each do |p|
        csv << [p.id, p.title,  p.user.profile.name, p.user.profile.company, p.average_ranking]
      end
    end
  end
end
