# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :auth_user

  def auth_user
    redirect_to new_session_path if session[:user].nil?
  end
end
