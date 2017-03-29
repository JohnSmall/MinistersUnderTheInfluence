class Api::V1::PeopleController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/people/{id}' do
    operation :get do
      key :description, 'Returns a single person if the user has access'
      key :operationId, 'findPersonById'
      key :tags, [
        'person'
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
        key :description, 'person response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :Person
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

  swagger_path '/people' do
    operation :get do
      key :description, 'Returns a list of people if the user has access'
      key :tags, [
        'person'
      ]
      response 200 do
        key :description, 'people response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :Person
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

  Api::V1::PersonResource._relationships.values.reject{|r| r.name =~/people/}.each do | rel |
    swagger_path "/people/{id}/#{rel.name}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single person"
      key :operationId, 'findPersonMeetingsById'
      key :tags, [
        'person'
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
