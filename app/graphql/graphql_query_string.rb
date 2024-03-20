# frozen_string_literal: true

class GraphqlQueryString
  def self.policies
    <<~QUERY
      query {
        policies {
          validity
          vehicle {
            plate
          }
          insured {
            name
            documentNumber
          }
        }
      }
    QUERY
  end
end
