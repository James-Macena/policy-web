# frozen_string_literal: true

class PoliciesController < ApplicationController
  def index
    @policies = policy_api_client.list_policies
  end

  private

  def policy_api_client
    Clients::PolicyApi.new(session[:user_token])
  end
end
