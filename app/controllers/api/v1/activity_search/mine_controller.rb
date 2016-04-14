class Api::V1::ActivitySearch::MineController < Api::BaseController
  before_action :authenticate

  def index
    activities = current_user.activities

    render json: activities
  end
end
