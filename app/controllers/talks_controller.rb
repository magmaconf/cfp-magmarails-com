class TalksController < ActionController::Base
  protect_from_forgery
  respond_to :js, :html

  def index
    @propos = Cfp::Proposal.approved.paginate(page: params[:page], per_page: 10, :order => "created_at DESC")
    respond_with(@props) do |format|
      format.js { @propos }
    end
  end

end
