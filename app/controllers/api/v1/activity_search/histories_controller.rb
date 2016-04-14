class Api::V1::ActivitySearch::HistoriesController < Api::BaseController
  before_action :authenticate

  def index
    activities = current_user.activities.where(state: ["cancelled", "completed"]) 

    render json: activities
  end
end
