require_dependency Cfp::Engine.root.join('app', 'controllers', 'cfp', 'comments_controller').to_s

Cfp::CommentsController.class_eval do

  def index
    @comments = @proposal.comments
    @score    = Cfp::Rank.for_proposal_user(@proposal, current_user)
    @next = Cfp::Proposal.first(:conditions => ["id < ?", @proposal.id], :order => "id desc")
    @prev = Cfp::Proposal.first(:conditions => ["id > ?", @proposal.id], :order => "id asc")
  end

end
