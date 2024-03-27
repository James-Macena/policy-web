# frozen_string_literal: true

module Clients
  class PolicyApi
    attr_reader :auth_token

    def initialize(auth_token)
      @auth_token = auth_token
    end

    def list_policies
      query_string = GraphqlQueryString.policies

      response = perform_request(query_string)
      response.body.with_indifferent_access
                   .dig(:data, :policies)
    end

    private

    def perform_request(query_string)
      faraday_connection.post('/graphql', { query: query_string })
    end

    def faraday_connection
      Faraday.new(url: ENV.fetch('POLICY_API_URL')) do |builder|
        builder.request :authorization, 'Bearer', -> { auth_token }
        builder.request :json
        builder.response :json
      end
    end
  end
end
