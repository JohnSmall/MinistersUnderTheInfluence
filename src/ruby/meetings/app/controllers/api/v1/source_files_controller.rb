class Api::V1::SourceFilesController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/source-files/{id}' do
    operation :get do
      key :description, 'Returns a single source-file if the user has access'
      key :operationId, 'findSourceFileById'
      key :tags, [
        'source-file'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of source-file to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, 'source-file response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :SourceFile
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
      key :description, 'updates a source-file record'
      key :operationId, 'updateSourceFile' 
      key :tags, [
        'source-file'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of source-file to update'
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
          key :'$ref', :PatchSourceFile
        end
      end
      parameter  do
        key :name,:type
        key :type,:string
        key :description, "type of resource, must be 'source-files'"
      end
      response 200 do
        key :description, 'source-files response'
        schema do
          property :data do
            key :'$ref', :SourceFile
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

  swagger_path '/source-files' do
    operation :get do
      key :description, 'Returns a list of source-files if the user has access'
      key :tags, [
        'source-file'
      ]
      response 200 do
        key :description, 'source-files response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :SourceFile
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
      key :description, 'creates a source-file record'
      key :operationId, 'addSourceFile' 
      key :tags, [
        'source-file'
      ]
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PostSourceFile
        end
      end
      parameter  do
        key :name,:type
        key :type,:string
        key :description, "type of resource, must be 'source-files'"
      end
      response 200 do
        key :description, 'source-files response'
        schema do
          property :data do
            key :'$ref', :SourceFile
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

  Api::V1::SourceFileResource._relationships.values.each do | rel |
    swagger_path "/source-files/{id}/#{rel.name.dasherize}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single source-file"
      key :operationId, "findSourceFile#{rel.name.capitalize}ById"
      key :tags, [
        'source-file'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of source-file to fetch'
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
