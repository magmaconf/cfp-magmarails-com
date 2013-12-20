module ApplicationHelper

  def already_reviewed(proposal)
    content_tag 'i','', class: 'fa fa-check raked' if Cfp::Rank.for_proposal_user(proposal, current_user) && current_user.can_review?
  end

  def comments_count(proposal)
    proposal.comments.count
  end

  def languages
    Cfp::Profile::LOCALES.collect {|l| [t(l, scope: 'languages'), l]}
  end

  def profile_new?
    controller.action_name == 'new' && controller.controller_name == 'profiles'
  end

  def remaining_days
    t = Time.now
    date_to_go = (Time.new(2013, 12, 30) - Time.new(t.year, t.month, t.day)).to_i / (86400)
    date_to_go.to_s.rjust(1, '0')
  end

  def user_based_proposal_path(proposal)
    current_user.can_review? ? proposal_comments_path(proposal) : proposal_path(proposal)
  end

  def available?
    !(remaining_days.to_i < 0)
  end

end
