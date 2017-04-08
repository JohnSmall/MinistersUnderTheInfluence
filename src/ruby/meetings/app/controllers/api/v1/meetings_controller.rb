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
    operation :patch do
      key :description, 'updates a meeting record'
      key :operationId, 'updateMeeting' 
      key :tags, [
        'meeting'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of meeting to update'
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
          key :'$ref', :PatchMeeting
        end
      end
      response 200 do
        key :description, 'meetings response'
        schema do
          property :data do
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
    operation :post do
      key :description, 'creates a meeting record'
      key :operationId, 'addMeeting' 
      key :tags, [
        'meeting'
      ]
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PostMeeting
        end
      end
      response 200 do
        key :description, 'meetings response'
        schema do
          property :data do
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

  Api::V1::MeetingResource._relationships.values.each do | rel |
    swagger_path "/meetings/{id}/#{rel.name.dasherize}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single meeting"
      key :operationId, "findMeeting#{rel.name.capitalize}ById"
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
