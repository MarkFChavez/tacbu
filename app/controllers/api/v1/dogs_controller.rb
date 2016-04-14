class Api::V1::DogsController < Api::BaseController
  before_action :authenticate

  def index
    @dogs = [{ name: "dog 1" }, { name: "dog 2" }]

    render json: @dogs
  end
end
