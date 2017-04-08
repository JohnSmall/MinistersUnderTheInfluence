class Api::V1::SourceFileResource < JSONAPI::Resource
  include Swagger::Blocks
  attributes :location,:uri
  has_many :means_of_influences
  has_many :meetings
  has_many :hospitalities
  has_many :travels
  has_many :gifts

  swagger_schema :SourceFile do
    key :type, :object
    property :attributes do
      property :location do
        key :type, :string
      end
      property :uri do
        key :type, :string
      end
    end

    key :required, [:id,:type]
    property :links do
      property :self do
        key :type,:integer
      end
    end

    property :relationships do
      Api::V1::SourceFileResource._relationships.each do | rel |
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



  swagger_schema "PostSourceFile".to_sym do
    allOf do
      schema do
        key :required, [:data]
        property :data do
          key :type,:object
          key :required, [:type,:attributes]
          property :type do
            key :type,:string
          end
          property :attributes do
            property :location do
              key :type, :string
            end
            property :uri do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_schema "PatchSourceFile".to_sym do
    allOf do
      schema do
        key :required, [:data]
        property :data do
          key :type,:object
          key :required, [:type,:id,:name]
          property :type do
            key :type,:string
          end
          property :id do
            key :type,:integer
          end
          property :attributes do
            property :location do
              key :type, :string
            end
            property :uri do
              key :type, :string
            end
          end
        end
      end
    end
  end
end
