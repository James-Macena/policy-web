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

  def self.create_policy(params)
    <<~QUERY
      mutation {
        createPolicy(
          input:{
            policy: {
              validity: "#{params[:validity]}"
              vehicle: {
                model: "#{params[:vehicle][:model]}"
                make: "#{params[:vehicle][:make]}"
                plate: "#{params[:vehicle][:plate]}"
                year: "#{params[:vehicle][:year]}"
              }
              insured: {
                name: "#{params[:insured][:name]}"
                documentNumber: "#{params[:insured][:document_number]}"
                documentType: "#{params[:insured][:document_type]}"
              }
            }
          }
        ) {
            status
            description
          }
      }
    QUERY
  end
end
