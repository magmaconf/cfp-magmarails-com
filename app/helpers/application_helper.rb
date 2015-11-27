module ApplicationHelper

  def already_reviewed(proposal)
    image_tag 'read_icon.png' if Cfp::Rank.for_proposal_user(proposal, current_user) && current_user.can_review?
  end

  def reviewed(proposal)
    Cfp::Rank.for_proposal_user(proposal, current_user) && current_user.can_review?
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
    date_to_go = remainder.to_i
    date_to_go.to_s.rjust(1, '0')
  end

  def user_based_proposal_path(proposal)
    current_user.can_review? ? proposal_comments_path(proposal) : proposal_path(proposal)
  end

  def available?
    !(remaining_days.to_i < 0)
  end

  def proposal_author(proposal)
    proposal.user.name
  end

  def proposal_author_email(proposal)
    proposal.user.profile_email
  end

  def proposal_author_company(proposal)
    proposal.user.profile_company
  end

  def reylero_fallback
    raw(asset_url 'reylero_crossed.png')
  end
end
