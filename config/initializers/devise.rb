# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'

  config.omniauth :google_oauth2, ENV.fetch('GOOGLE_CLIENT_ID'), ENV.fetch('GOOGLE_CLIENT_SECRET')
  config.omniauth :cognito_idp, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
    client_options: {
      site: ENV['COGNITO_USER_POOL_SITE']
    },
    name: 'cognito_idp',
    scope: 'email openid',
    user_pool_id: ENV['COGNITO_USER_POOL_ID'],
    aws_region: ENV['AWS_REGION']

  config.mailer_sender = 'policy-web@example.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.remember_for = 1.week
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :time
  config.maximum_attempts = 6
  config.unlock_in = 1.hour
  config.last_attempt_warning = true
  config.reset_password_keys = [:email]
  config.reset_password_within = 2.hours
  config.sign_in_after_reset_password = true
  config.sign_out_via = :delete
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
  config.sign_in_after_change_password = true
end
