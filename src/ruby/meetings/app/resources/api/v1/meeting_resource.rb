class Api::V1::MeetingResource < Api::V1::MeansOfInfluenceResource
  include Swagger::Blocks
  attributes :purpose
  _model_name.constantize.reflections.keys.each do | assoc |
    has_many assoc.to_sym
  end

  swagger_schema _model_name.to_sym do
      key :type, :object
      property :attributes do
        property :purpose do
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
          key :type,:integer
        end
      end

      property :relationships do
        Meeting.reflections.keys.each do | assoc |
          property assoc.underscore.downcase.to_sym do
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



  swagger_schema :MeetingInput do
    allOf do
      schema do
        key :'$ref', :Meeting
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
