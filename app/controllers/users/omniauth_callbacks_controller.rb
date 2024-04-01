# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      sign_in @user
      create_user_token
      redirect_to root_path
    end

    def cognito_idp
      @user = User.from_omniauth(request.env['omniauth.auth'])

      sign_in @user
      create_user_token
      redirect_to root_path
    end

    private

    def create_user_token
      session[:user_token] = JWT.encode(
        @user,
        ENV.fetch('JWT_SECRET_KEY'),
        ENV.fetch('JWT_ALGORITHM')
      )
    end
  end
end
