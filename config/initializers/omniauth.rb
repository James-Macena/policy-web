# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('GOOGLE_CLIENT_ID'), ENV.fetch('GOOGLE_CLIENT_SECRET')
  provider :cognito_idp, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
           client_options: {
             site: ENV['COGNITO_USER_POOL_SITE']
           },
           name: 'cognito_idp',
           scope: 'email openid',
           user_pool_id: ENV['COGNITO_USER_POOL_ID'],
           aws_region: ENV['AWS_REGION']
end
