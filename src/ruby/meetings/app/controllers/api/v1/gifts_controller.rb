class Api::V1::GiftsController < JSONAPI::ResourceController
  include Swagger::Blocks
  swagger_path '/gifts/{id}' do
    operation :get do
      key :description, 'Returns a single gift if the user has access'
      key :operationId, 'findGiftById'
      key :tags, [
        'gift'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of gift to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      response 200 do
        key :description, 'gift response'
        schema do
          property :data do
            key :type,:object
            key :'$ref', :Gift
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
      key :description, 'updates a gift record'
      key :operationId, 'updateGift' 
      key :tags, [
        'gift'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of gift to update'
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
          key :'$ref', :PatchGift
        end
      end
      response 200 do
        key :description, 'gifts response'
        schema do
          property :data do
            key :'$ref', :Gift
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

  swagger_path '/gifts' do
    operation :get do
      key :description, 'Returns a list of gifts if the user has access'
      key :tags, [
        'gift'
      ]
      response 200 do
        key :description, 'gifts response'
        schema do
          property :data do
            key :type,:array
            items do
              key :'$ref', :Gift
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
      key :description, 'creates a gift record'
      key :operationId, 'addGift' 
      key :tags, [
        'gift'
      ]
      key :consumes, ['application/vnd.api+json']
      key :produces, ['application/vnd.api+json']
      parameter do
        key :name,:data
        key :type,:object
        key :in,:body
        schema do
          key :'$ref', :PostGift
        end
      end
      response 200 do
        key :description, 'gifts response'
        schema do
          property :data do
            key :'$ref', :Gift
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

  Api::V1::GiftResource._relationships.values.each do | rel |
    swagger_path "/gifts/{id}/#{rel.name.dasherize}" do
    operation :get do
      key :description, "Returns an array of #{rel.name} for a single gift"
      key :operationId, "findGift#{rel.name.capitalize}ById"
      key :tags, [
        'gift'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of gift to fetch'
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
