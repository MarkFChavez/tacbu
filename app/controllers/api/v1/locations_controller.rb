class Api::V1::LocationsController < Api::BaseController

  before_action :authenticate

  def index
    locations = Location.all

    render json: locations, root: nil
  end

end
