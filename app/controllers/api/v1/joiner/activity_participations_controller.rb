class Api::V1::Joiner::ActivityParticipationsController < Api::BaseController

  before_action :authenticate

  def create
    user_activity = UserActivity.new(activity: activity, 
                                     user: joiner,
                                     role: :joiner)

    user_activity.save

    render json: user_activity
  end

  private

  def activity
    Activity.find(params[:activity_id])
  end

  def joiner
    User.find(params[:joiner_id])
  end
end
