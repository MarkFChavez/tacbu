class Activity < ActiveRecord::Base
  belongs_to :location
  belongs_to :category

  has_many :user_activities, dependent: :destroy
  has_many :participants, through: :user_activities, class_name: "User"

  validates :name, presence: true
end
