class Api::V1::MeController < Api::BaseController

  before_action :authenticate

  def show
    render json: current_user
  end
end
