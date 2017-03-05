class Api::V1::PersonResource < Api::V1::EntityResource
  _model_name.constantize.reflections.keys.each do | assoc |
    has_many assoc.to_sym
  end
end
