class Api::V1::MeansOfInfluenceResource < JSONAPI::Resource
  include Swagger::Blocks
  # attributes :year,:month,:source_file_id,:source_file_line_number
  attributes :year, :month, :day, :source_file_id, :source_file_line_number
  has_one :source_file
  has_many :organisations
  has_many :organisation_people
  has_many :government_people
  has_many :government_offices
end
