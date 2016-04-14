class Api::V1::ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :date_from, :date_to
  attributes :category
end
