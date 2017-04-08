class Api::V1::GovernmentOfficesController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/government-offices/{id}' do
    operation :get do
      key :description, 'Returns a single government_office if the user has access'
      key :operationId, 'findGovernmentOfficeById'
      key :tags, [
        'government-office'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of government-office to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      response 200 do
        key :description, 'government-office response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :GovernmentOffice
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
      key :description, 'updates a government-office record'
      key :operationId, 'updateGovernmentOffice' 
      key :tags, [
        'government-office'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of government-office to update'
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
          key :'$ref', :PatchGovernmentOffice
        end
      end
      parameter  do
        key :name,:type
        key :type,:string
        key :description, "type of resource, must be 'government-offices'"
      end
      response 200 do
        key :description, 'government-offices response'
        schema do
          property :data do
            key :'$ref', :GovernmentOffice
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

  swagger_path '/government-offices' do
    operation :get do
      key :description, 'Returns a list of government-offices if the user has access'
      key :tags, [
        'government-office'
      ]
      response 200 do
        key :description, 'government-offices response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :GovernmentOffice
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
      key :description, 'creates a government-office record'
      key :operationId, 'addGovernmentOffice' 
      key :tags, [
        'government-office'
      ]
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PostGovernmentOffice
        end
      end
      parameter  do
        key :name,:type
        key :type,:string
        key :description, "type of resource, must be 'government-offices'"
      end
      response 200 do
        key :description, 'government-offices response'
        schema do
          property :data do
            key :'$ref', :GovernmentOffice
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

  Api::V1::GovernmentOfficeResource._relationships.values.reject{|r| r.name =~/people/}.each do | rel |
    swagger_path "/government-offices/{id}/#{rel.name}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single government office"
      key :operationId, "findGovernmentOffice#{rel.name.capitalize}ById"
      key :tags, [
        'government-office'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of government-office to fetch'
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
