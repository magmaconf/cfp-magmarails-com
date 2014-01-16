require_dependency Cfp::Engine.root.join('app', 'controllers', 'cfp', 'application_controller').to_s

module Cfp
  class RankedProposalsController < BaseController

    before_filter :verify_admin

    respond_to :js, :html

    def index
      redirect_to :proposals unless current_user.is_organizer?
      @ranked_proposals = Proposal.ranked_and_sorted
    end

    private

    def verify_admin
      redirect_to proposals_path unless current_user.is_admin?
    end

  end
end

