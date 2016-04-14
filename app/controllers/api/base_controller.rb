class Api::BaseController < ActionController::Base

  protect_from_forgery with: :null_session

  respond_to :json

  private

  def authenticate
    user = User.find_by(access_token: access_token)

    if user
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
    render json: { error: "Please sign in to continue." }, status: 401
  end

  def access_token
    request.headers['Authorization']
  end
end
