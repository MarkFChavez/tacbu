class Api::V1::ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :date_from, :date_to
  attributes :category, :organized_by

  def organized_by
    object.organizer
  end
end
