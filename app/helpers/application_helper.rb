module ApplicationHelper

  def already_reviewed(proposal)
    if Cfp::Rank.for_proposal_user(proposal, current_user)
      raw "<i class='icon-ok'></i>"
    end
  end

end
