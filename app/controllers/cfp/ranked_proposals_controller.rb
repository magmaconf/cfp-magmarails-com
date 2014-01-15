require_dependency Cfp::Engine.root.join('app', 'controllers', 'cfp', 'application_controller').to_s

module Cfp
  class RankedProposalsController < BaseController

  respond_to :js, :html

    def index
      @ranked_proposals = Proposal.ranked_and_sorted
    end
  end
end
