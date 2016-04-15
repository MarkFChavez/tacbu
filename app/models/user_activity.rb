class UserActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  after_initialize :set_initial_state

  def self.organizers
    where(role: :organizer)
  end

  state_machine :state, initial: :pending do
    event :deny do
      transition any => :denied
    end

    event :approve do
      transition any => :approved
    end

    event :cancel do
      transition any => :cancelled
    end
  end

  private

  def set_initial_state
    self.state ||= :pending
  end
end
