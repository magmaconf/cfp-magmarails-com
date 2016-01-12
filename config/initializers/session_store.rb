# Be sure to restart your server when you modify this fiR.config.session_store :cookie_store, key: '_cfp_session'

Rails.application.config.session_store :cookie_store, key: '_cfp_session'
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# CfpMagmaCom::Application.config.session_store :active_record_store
