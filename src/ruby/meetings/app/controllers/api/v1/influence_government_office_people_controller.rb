class Api::V1::InfluenceGovernmentOfficePeopleController < JSONAPI::ResourceController
  include Swagger::Blocks

  swagger_path '/influence-government-office-people' do
    operation :get do
      key :description, 'Returns a list of links between influences government-offices and people if the user has access'
      key :tags, [
        'influence-government-office-people'
      ]
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, 'influence-government-office-person response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :InfluenceGovernmentOfficePerson
            end
          end
        end
      end
      # response :default do
      #   key :description, 'unexpected error'
      #   schema do
      #     key :'$ref', :ErrorModel
      #   end
      # end
    end
    operation :post do
      key :description, 'creates a link between means of influence government-office and person in the government-office'
      key :operationId, 'addPerson' 
      key :tags, [
        'influence-government-office-people'
      ]
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PostInfluenceGovernmentOfficePerson
        end
      end
      parameter  do
        key :name,:type
        key :type,:string
        key :description, "type of resource, must be 'people'"
      end
      response 200 do
        key :description, 'people response'
        schema do
          property :data do
            key :'$ref', :InfluenceGovernmentOfficePerson
          end
        end
      end
    end
  end
end
