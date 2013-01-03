class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :load_settings

  def load_settings
    Cfp::Config.load_from_persistance if Rails.env.development?
  end
end
