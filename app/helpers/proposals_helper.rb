module ProposalsHelper
  def proposal_position(proposal)
    "#{Cfp::Proposal.order('id desc').ids.index(proposal.id) + 1} / #{Cfp::Proposal.count}"
  end
end
