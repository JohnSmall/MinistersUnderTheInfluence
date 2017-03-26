class Api::V1::MeetingsController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/meetings/{id}' do
    operation :get do
      key :description, 'Returns a single meeting if the user has access'
      key :operationId, 'findMeetingById'
      key :tags, [
        'meeting'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of meeting to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, 'meeting response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :Meeting
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

  swagger_path '/meetings' do
    operation :get do
      key :description, 'Returns a list of meetings if the user has access'
      key :tags, [
        'meeting'
      ]
      response 200 do
        key :description, 'meetings response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :Meeting
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
