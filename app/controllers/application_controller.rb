class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :load_settings
  before_filter :load_talks

  force_ssl if Rails.env.production?

  def load_settings
    Cfp::Config.load_from_persistance if Rails.env.development?
  end

  def load_talks
    @propos = Cfp::Proposal.approved.order("created_at desc").limit(10).page(params[:page])
    @propos_phone = Cfp::Proposal.approved.reverse
  end

end
