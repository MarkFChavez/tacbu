class Api::V1::ActivitySearch::MineController < Api::BaseController

  before_action :authenticate

  def index
    activity_ids = UserActivity.where(role: :organizer, user: current_user).pluck(:activity_id)
    activities = Activity.where(id: activity_ids.uniq)

    render json: activities, each_serializer: Api::V1::ActivitySerializer, root: nil
  end
end
