class Api::V1::GovernmentOfficeResource < Api::V1::EntityResource
  include Swagger::Blocks
  _model_name.constantize.reflections.keys.each do | assoc |
    has_many assoc.to_sym
  end

  swagger_schema _model_name.to_sym do
      key :type, :object
      property :attributes do
        property :name do
          key :type, :string
        end
        property :wikipedia_entry do
          key :type, :string
        end
      end

      key :required, [:id,:type]
      property :links do
        property :self do
          key :type,:string
        end
      end

      property :relationships do
        Api::V1::GovernmentOfficeResource._relationships.each do | rel |
          property rel[1].name.underscore.downcase.to_sym do
          property :self do
            key :type,:string
          end
          property :related do
            key :type,:string
          end
        end
        end
      end
  end



  swagger_schema :GovernmentOfficeInput do
    allOf do
      schema do
        key :'$ref', :GovernmentOffice
      end
      schema do
        key :required, [:name]
        property :id do
          key :type, :integer
          key :format, :int64
        end
      end
    end
  end
end
