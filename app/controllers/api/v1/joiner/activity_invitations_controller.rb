class Joiner::ActivityInvitationsController < Api::BaseController

  before_action :authenticate

  def update
    user_activity = UserActivity.find_by(user: joiner, activity: activity, state: :pending)

    # update user activity to approved
    if user_activity
      user_activity.approve
    end

    # cancel all on going joiners
    activity.joined_user_activity.where.not(user: joiner).where(state: :pending).map(&:cancel)

    render json: user_activities
  end

  private

  def activity
    Activity.find(params[:id])
  end

  def joiner
    User.find(params[:joiner_id])
  end
end
