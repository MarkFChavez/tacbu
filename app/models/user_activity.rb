class UserActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  def self.organizers
    where(role: :organizer)
  end
end
