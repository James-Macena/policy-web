# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :auth_user, only: %i[new omniauth]

  def new; end

  def omniauth
    data = request.env['omniauth.auth']
    user_info = data['info']
    session[:user] = {
      uid: data['uid'],
      provider: data['provider'],
      name: user_info['name'],
      email: user_info['email']
    }

    redirect_to root_path
  end
end
