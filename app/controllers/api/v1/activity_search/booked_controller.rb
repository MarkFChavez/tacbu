class Api::V1::ActivitySearch::BookedController < Api::BaseController
  before_action :authenticate

  def index
    activities = current_user.activities.where(state: :booked) 

    render json: activities
  end
end
