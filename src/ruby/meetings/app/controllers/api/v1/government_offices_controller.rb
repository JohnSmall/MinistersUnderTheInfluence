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
  end
end
