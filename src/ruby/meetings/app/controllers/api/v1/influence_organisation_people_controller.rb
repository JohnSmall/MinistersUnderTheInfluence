class Api::V1::InfluenceOrganisationPeopleController < JSONAPI::ResourceController
  include Swagger::Blocks

  swagger_path '/influence-organisation-people' do
    operation :get do
      key :description, 'Returns a list of links between influences organisations and people if the user has access'
      key :tags, [
        'influence-organisation-people'
      ]
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, 'influence-organisation-person response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :InfluenceOrganisationPerson
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
      key :description, 'creates a link between means of influence organisation and person in the organisation'
      key :operationId, 'addPerson' 
      key :tags, [
        'influence-organisation-people'
      ]
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PostInfluenceOrganisationPerson
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
            key :'$ref', :InfluenceOrganisationPerson
          end
        end
      end
    end
  end
end
