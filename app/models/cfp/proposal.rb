# == Schema Information
#
# Table name: cfp_proposals
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  level       :string
#  abstract    :text
#  description :text
#  language    :string
#  tags        :string
#  created_at  :datetime
#  updated_at  :datetime
#  approved    :boolean          default(FALSE)
#

require_dependency Cfp::Engine.root.join("app", "models", "cfp", "proposal")

Cfp::Proposal.class_eval do
  after_create do
    SubmissionMailer.submitted(self).deliver
  end

  def self.pending_titles
    where(approved: false).collect { |p| [p.id, p.title] }
  end

  # TODO: Code Below is horrible and should probably be handled
  # with counter caches directly on the cfp gem.
  #
  # Still, serves its purpose.
  #
  def self.ranked_and_sorted
    all.sort { |a,b| b.average_ranking <=> a.average_ranking }
  end

  def self.ranked_and_sorted_titles
    all.to_a.inject([]) {
      |m,v| m << {talk: v.title, rank: v.average_ranking}; m
    }.sort { |a,b| b[:rank] <=> a[:rank] }
  end
end
