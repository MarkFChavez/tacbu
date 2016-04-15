class Api::V1::ActivitySearch::BookedController < Api::BaseController
  before_action :authenticate

  def index
    activity_ids = current_user.user_activities.where(role: :joiner).map(&:activity_id)
    activities = Activity.where(id: activity_ids)

    render json: activities, each_serializer: Api::V1::ActivitySerializer, root: nil
  end
end
