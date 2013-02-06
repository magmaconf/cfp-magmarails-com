module ApplicationHelper

  def already_reviewed(proposal)
    if Cfp::Rank.for_proposal_user(proposal, current_user)
      raw "<i class='icon-ok'></i>"
    end
  end

  def prev_help(id)
    prev_proposal = Cfp::Proposal.where(id: id - 1)
    link_to(raw("<i class='icon-arrow-left'></i> Prev"), proposal_comments_path(prev_proposal.first.id), class: 'pull-left' )  if prev_proposal.first
  end

  def next_help(id)
    next_proposal = Cfp::Proposal.where(id: id + 1)
    link_to(raw("Next <i class='icon-arrow-right'></i>"), proposal_comments_path(next_proposal.first.id), class: 'pull-right' )  if next_proposal.first
  end

end
