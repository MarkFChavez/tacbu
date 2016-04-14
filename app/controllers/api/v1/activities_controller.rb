class Api::V1::ActivitiesController < Api::BaseController

  before_action :authenticate

  def index
    activities = Activity.all

    activities = activities.where(category:category) if category
    activities = activities.where(preferred_gender:preferred_gender) if preferred_gender
    activities = activities.where("preferred_age_from <= ? ", preferred_age_from).where("preferred_age_to >= ? ", preferred_age_to) if  preferred_age_from && preferred_age_to
    activities = activities.where(location_id:location.try(:id)) if params[:location]
    activities = activities.where(state:state) if state
    activities = activities.where(date_from:date_from) if date_from && !date_to
    activities = activities.where("date_from >= ? ", date_from).where("date_from <= ? ", date_to) if date_from && date_to

    render json: activities
  end

  def show
    activity = Activity.find(params[:id])

    render json: activity
  end

  def create
    activity = Activity.new(activities_params)
    activity.save

    render json: activity
  end

  def update
    activity = Activity.find(params[:id])
    activity.update(activities_params)

    render json: activity
  end

  private

  def category
    params[:category]
  end

  def preferred_gender
    params[:preferred_gender]
  end

  def location
    Location.find_by(city:params[:location]) if params[:location]
  end

  def state
    params[:state]
  end

  def date_from
    params[:date_from]
  end

  def date_to
    params[:date_to]
  end

  def preferred_age_from
    params[:preferred_age_from]
  end

  def preferred_age_to
    params[:preferred_age_to]
  end

  def activities_params
    params.require(:activity).permit(:date_from, :date_to, :name, :location_id, :preferred_gender, :preferred_age_from, :preferred_age_to, :description, :category_id)
  end
end
