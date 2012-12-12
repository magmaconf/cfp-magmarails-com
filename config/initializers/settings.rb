begin
  Cfp::Config.load_from_persistance!
rescue Exception
  Rails.logger.warn "Settings were not loaded"
end
