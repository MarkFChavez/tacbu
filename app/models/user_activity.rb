class UserActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  def self.organizers
    where(role: :organizer)
  end

  state_machine :state, initial: :pending do
  end
end
