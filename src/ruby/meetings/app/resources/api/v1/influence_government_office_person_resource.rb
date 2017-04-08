class Api::V1::InfluenceGovernmentOfficePersonResource < Api::V1::InfluenceOfficePersonResource
  has_one :government_office,foreign_key: 'office_id',class: GovernmentOffice

  swagger_schema :InfluenceGovernmentOfficePerson do
    key :type, :object
    key :required, [:id,:type]
    property :id do
      key :type,:integer
    end
    property :type do
      key :type,:string
    end

    property :links do
      property :self do
        key :type,:string
      end
    end

    property :relationships do
      Api::V1::InfluenceGovernmentOfficePersonResource._relationships.each do | rel |
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

  swagger_schema :PostInfluenceGovernmentOfficePerson do
    allOf do
      schema do
        key :required, [:data]
        property :data do
          key :type,:object
          key :required, [:type,:name]
          property :type do
            key :type,:string
          end
          property :relationships, type: :object do
            [:meeting, 'government-office', :person].each do | rel |
              property rel,type: :object do
              property :data, type: :object do
                property :type, type: :string
                property :id, type: :integer
              end
            end
            end
          end
        end
      end
    end
  end

end
