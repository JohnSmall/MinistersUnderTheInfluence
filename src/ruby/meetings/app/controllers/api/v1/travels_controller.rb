class Api::V1::TravelsController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/travels/{id}' do
    operation :get do
      key :description, 'Returns a single travel if the user has access'
      key :operationId, 'findTravelById'
      key :tags, [
        'travel'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of travel to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, 'travel response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :Travel
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

    operation :patch do
      key :description, 'updates a travel record'
      key :operationId, 'updateTravel' 
      key :tags, [
        'travel'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of travel to update'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PatchTravel
        end
      end
      response 200 do
        key :description, 'travels response'
        schema do
          property :data do
            key :'$ref', :Travel
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

  swagger_path '/travels' do
    operation :get do
      key :description, 'Returns a list of travels if the user has access'
      key :tags, [
        'travel'
      ]
      response 200 do
        key :description, 'travels response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :Travel
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
      key :description, 'creates a travel record'
      key :operationId, 'addTravel' 
      key :tags, [
        'travel'
      ]
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PostTravel
        end
      end
      response 200 do
        key :description, 'travels response'
        schema do
          property :data do
            key :'$ref', :Travel
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

  Api::V1::TravelResource._relationships.values.each do | rel |
    swagger_path "/travels/{id}/#{rel.name.dasherize}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single travel"
      key :operationId, "findTravel#{rel.name.capitalize}ById"
      key :tags, [
        'travel'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of travel to fetch'
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
