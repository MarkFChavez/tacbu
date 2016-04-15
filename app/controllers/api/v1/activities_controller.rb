class Api::V1::ActivitiesController < Api::BaseController

  before_action :authenticate

  def index
    activities = ActivityCatalog.all(attributes: params, user: current_user)

    render json: activities, root: nil
  end

  def show
    activity = Activity.find(params[:id])

    render json: activity, root: nil
  end

  def create
    activity = ActivityOrganizer.create(attributes: activities_params, organizer: current_user)

    render json: activity, status: :created
  end

  def update
    activity = Activity.find(params[:id])
    activity.update(activities_params)

    render json: activity
  end

  private

  def activities_params
    params.require(:activity).permit(:date_from, :date_to, :name, :location_id, :preferred_gender, :preferred_age_from, :preferred_age_to, :description, :category_id)
  end
end
