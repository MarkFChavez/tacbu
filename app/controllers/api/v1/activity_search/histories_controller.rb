class Api::V1::ActivitySearch::HistoriesController < Api::BaseController

  before_action :authenticate

  def index
    activities = current_user.activities.on_history

    render json: activities, root: nil
  end
end
