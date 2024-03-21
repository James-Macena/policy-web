# frozen_string_literal: true

class PoliciesController < ApplicationController
  def index
    query_string = GraphqlQueryString.policies
    response = Faraday.post(
      "#{ENV.fetch('POLICY_API_URL')}/graphql",
      { query: query_string }.to_json,
      'Content-Type': 'application/json'
    )

    @policies = JSON.parse(response.body, symbolize_names: true)
                    .dig(:data, :policies)
  end
end
