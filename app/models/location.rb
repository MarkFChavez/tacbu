class Location < ActiveRecord::Base
  has_many :activities, dependent: :destroy
end
