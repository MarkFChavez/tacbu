class Activity < ActiveRecord::Base
  belongs_to :location
  belongs_to :category

  has_many :user_activities, dependent: :destroy
  has_many :members, through: :user_activities, class_name: "User"

  validates :name, presence: true

  def organizer
    user_activity = user_activities.organizers.last
    user_activity.try(:user)
  end
end
