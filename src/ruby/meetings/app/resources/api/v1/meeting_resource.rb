class Api::V1::MeetingResource < Api::V1::MeansOfInfluenceResource
  attributes :purpose

  swagger_schema :Meeting do
    key :type, :object
    property :attributes do
      property :purpose do
        key :type, :string
      end
      property :year do
        key :type, :integer
        key :format, :int32
      end
      property :month do
        key :type, :integer
      end
      property :day do
        key :type, :integer
      end
      property "source-file-id" do
        key :type, :integer
      end
      property "source-file-line-number" do
        key :type, :integer
      end
    end

    key :required, [:id,:type]
    property :links do
      property :self do
        key :type,:integer
      end
    end

    property :relationships do
      Api::V1::MeetingResource._relationships.each do | rel |
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



  swagger_schema "PostMeeting".to_sym do
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
            key :required, [:purpose,:year,:month]
            property :purpose do
              key :type, :string
            end
            property :year do
              key :type, :integer
            end
            property :month do
              key :type, :integer
            end
            property :day do
              key :type, :integer
            end
            property "source-file-id" do
              key :type, :integer
            end
            property "source-file-line-number" do
              key :type, :integer
            end
          end
        end
      end
    end
  end

  swagger_schema "PatchMeeting".to_sym do
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
            property :purpose do
              key :type, :string
            end
            property :year do
              key :type, :integer
            end
            property :month do
              key :type, :integer
            end
            property :day do
              key :type, :integer
            end
            property "source-file-id" do
              key :type, :integer
            end
            property "source-file-line-number" do
              key :type, :integer
            end
          end
        end
      end
    end
  end
end
