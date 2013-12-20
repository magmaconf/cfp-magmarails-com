require_dependency Cfp::Engine.root.join('app', 'controllers', 'cfp', 'application_controller').to_s
require_dependency Cfp::Engine.root.join('app', 'controllers', 'cfp', 'proposals_controller').to_s

module Cfp
  class ProposalsController < BaseController
    before_filter :load_proposal, :only => [:edit, :update, :destroy, :show]

    helper_method :remainder

    def index
      @proposals = Proposal.scoped_for(current_user).paginate(page: params[:page], per_page: 16, :order => "created_at DESC")
    end

    def new
      redirect_to :proposals unless remainder.to_i > -1
      @proposal = Proposal.new
    end

    def create
      @proposal = Proposal.new proposal_params
      @proposal.user = current_user
      if cfp_open? && @proposal.save
        redirect_to :proposals, :notice => t('proposals.created.success')
      else
        render :action => :new
      end
    end

    def edit
    end

    def update
      if @proposal.can_be_edited_by?(current_user) && @proposal.update_attributes(proposal_params)
        redirect_to :proposals, :notice => t('proposals.edited.success')
      else
        render :action => "edit"
      end
    end

    def destroy
      @proposal.destroy if @proposal.can_be_edited_by?(current_user)
      redirect_to :proposals, :notice => t('proposals.deleted.success')
    end

    def show ; end

    def remainder
      t = Time.now
      (Time.new(2013, 12, 30) - Time.new(t.year, t.month, t.day)).to_i / (86400)
    end

    private
    def load_proposal
      @proposal = Proposal.find params[:id]
      redirect_to :proposals unless @proposal.can_be_seen_by?(current_user)
    end

    private
    def proposal_params
      params.require(:proposal).permit :title, :abstract, :tags, :level, :language, :description
    end
  end
end
