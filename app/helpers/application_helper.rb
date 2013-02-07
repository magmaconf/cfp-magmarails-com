module ApplicationHelper

  def already_reviewed(proposal)
    if Cfp::Rank.for_proposal_user(proposal, current_user)
      raw "<i class='icon-ok'></i>"
    end
  end


  def next_help(id)
    ids = Cfp::Rank.where(:user_id => current_user.id).map(&:proposal_id) << id
    next_proposal = Cfp::Proposal.where('id NOT IN (?)', ids).first
    link_to(raw("Continue <i class='icon-arrow-right'></i>"), proposal_comments_path(next_proposal.id), class: 'btn btn-orange pull-right' )  if next_proposal
  end

end
