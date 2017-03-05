class Api::V1::EntityResource < JSONAPI::Resource
  abstract
  attributes :name,:wikipedia_entry
  filter :name
end
