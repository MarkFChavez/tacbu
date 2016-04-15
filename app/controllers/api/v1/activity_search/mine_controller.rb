class Api::V1::ActivitySearch::MineController < Api::BaseController

  before_action :authenticate

  def index
    activities = current_user.organized_activities.not_on_history

    render json: activities, root: nil
  end
end
