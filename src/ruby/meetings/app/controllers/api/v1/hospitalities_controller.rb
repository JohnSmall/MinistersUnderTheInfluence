class Api::V1::HospitalitiesController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/hospitalities/{id}' do
    operation :get do
      key :description, 'Returns a single hospitality if the user has access'
      key :operationId, 'findHospitalityById'
      key :tags, [
        'hospitality'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of hospitality to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, 'hospitality response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :Hospitality
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

  swagger_path '/hospitalities' do
    operation :get do
      key :description, 'Returns a list of hospitalities if the user has access'
      key :tags, [
        'hospitality'
      ]
      response 200 do
        key :description, 'hospitalities response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :Hospitality
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

  Api::V1::HospitalityResource._relationships.values.each do | rel |
    swagger_path "/hospitalities/{id}/#{rel.name.dasherize}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single hospitality"
      key :operationId, "findHospitality#{rel.name.capitalize}ById"
      key :tags, [
        'hospitality'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of hospitality to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      ref_name = (rel.name =~ /people/ ? 'Person' : rel.name).classify.to_sym
      response 200 do
        key :description, "#{rel.name} response"
        schema do
          property :data do
            key :type,:array
            items do
              key :type,:object
              key :'$ref', ref_name
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
