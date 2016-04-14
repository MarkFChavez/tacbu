class Api::V1::ActivitiesController < Api::BaseController

  before_action :authenticate

  def index
    activities = Activity.all
    # activities = activities.where(preferred_gender: [current_user.gender, "n"])
    
    activities = activities.where(category: category) if category
    activities = activities.where("preferred_age_from <= ? ", preferred_age_from).where("preferred_age_to >= ? ", preferred_age_to) if  preferred_age_from && preferred_age_to
    activities = activities.where(location_id: location_id) if params[:location_id]
    activities = activities.where(state: state) if state
    activities = activities.where(date_from: date_from) if date_from && !date_to
    activities = activities.where("date_from >= ? ", date_from).where("date_from <= ? ", date_to) if date_from && date_to

    render json: activities, root: nil
  end

  def show
    activity = Activity.find(params[:id])

    render json: activity, root: nil
  end

  def create
    activity = current_user.activities.build(activities_params)
    activity.state = :pending
    activity.save

    user_activity = current_user.organized_activities.build(activity: activity, role: :organizer)

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

  def location
    params[:location_id]
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
