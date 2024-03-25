# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :auth_user

  def new; end

  def omniauth
    data = request.env['omniauth.auth']
    user_info = data['info']
    user_data = {
      uid: data['uid'],
      name: user_info['name'],
      email: user_info['email']
    }

    session[:user] = user_data
    session[:user_token] = JWT.encode(user_data, ENV.fetch('JWT_SECRET_KEY'), ENV.fetch('JWT_ALGORITHM'))
    redirect_to root_path
  end
end
