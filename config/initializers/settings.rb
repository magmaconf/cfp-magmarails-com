begin
  Cfp::Config.load_from_persistance!
  Cfp::Config.call_for_papers_state = 'open'
rescue Exception
  Rails.logger.warn "Settings were not loaded"
end
