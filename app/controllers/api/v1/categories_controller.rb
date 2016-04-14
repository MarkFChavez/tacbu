class Api::V1::CategoriesController < Api::BaseController

  before_action :authenticate

  def index
    categories = Category.all

    render json: categories, root: nil
  end

end
