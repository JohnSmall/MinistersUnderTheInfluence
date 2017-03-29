class Api::V1::HospitalityResource < Api::V1::MeansOfInfluenceResource
  include Swagger::Blocks
  attributes :type_of_hospitality
  swagger_schema :Hospitality do
      key :type, :object
      property :attributes do
        property :type_of_hospitality do
          key :type, :string
        end
        property :year do
          key :type, :intger
        end
        property :month do
          key :type, :intger
        end
        property :day do
          key :type, :intger
        end
        property :source_file_id do
          key :type, :intger
        end
        property :source_file_line_number do
          key :type, :intger
        end
      end

      key :required, [:id,:type]
      property :links do
        property :self do
          key :type,:string
        end
      end

      property :relationships do
        Api::V1::HospitalityResource._relationships.each do | rel |
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



  swagger_schema :HospitalityInput do
    allOf do
      schema do
        key :'$ref', :Hospitality
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
