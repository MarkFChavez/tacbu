class ActivityOrganizer
  def self.create(attributes:, organizer:)
    new(attributes: attributes, organizer: organizer).create
  end

  def initialize(attributes:, organizer:)
    @attributes = attributes
    @organizer =  organizer
  end

  def create
    user_activity = current_user.organized_activities.build(activity: create_activity)

    user_activity.activity
  end

  private

  attr_reader :attributes, :organizer

  def create_activity
    activity = organizer.activities.build(attributes)
    activity.state = :pending
    activity.save

    activity
  end
end
