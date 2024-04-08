# frozen_string_literal: true

class PoliciesController < ApplicationController
  def index
    @policies = policy_api_client.list_policies
  end

  def new; end

  def create
    response = policy_api_client.create_policy(policy_params)

    if response[:description].present?
      flash[:notice] = response[:description]
    else
      flash[:alert] = 'Algo deu errado, tente novamente mais tarde.'
    end

    redirect_to root_path
  end

  private

  def policy_params
    params.require(:policy).permit(
      :validity,
      vehicle: %i[plate make model year],
      insured: %i[name document_type document_number]
    )
  end

  def policy_api_client
    Clients::PolicyApi.new(session[:user_token])
  end
end
