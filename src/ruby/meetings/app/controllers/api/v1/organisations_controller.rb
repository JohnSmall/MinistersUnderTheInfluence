class Api::V1::OrganisationsController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/organisations/{id}' do
    operation :get do
      key :description, 'Returns a single organisation if the user has access'
      key :operationId, 'findOrganisationById'
      key :tags, [
        'organisation'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of organisation to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      response 200 do
        key :description, 'organisation response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :Organisation
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
  end

  swagger_path '/organisations' do
    operation :get do
      key :description, 'Returns a list of organisations if the user has access'
      key :tags, [
        'organisation'
      ]
      response 200 do
        key :description, 'organisations response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :Organisation
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
  end

  Api::V1::OrganisationResource._relationships.values.reject{|r| r.name =~/people/}.each do | rel |
    swagger_path "/organisations/{id}/#{rel.name}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single organisation"
      key :operationId, "findOrganisatio#{rel.name.capitalize}ById"
      key :tags, [
        'organisation'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of person to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, "#{rel.name} response"
        schema do
          property :data do
            key :type,:array
            items do
              key :type,:object
              key :'$ref', rel.name.classify.to_sym
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
  end
  end
end
