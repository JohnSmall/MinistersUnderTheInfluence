class Api::V1::EntityResource < JSONAPI::Resource
  include Swagger::Blocks
  abstract
  attributes :name,:wikipedia_entry
  filter :name

end
