class Api::BaseController < ActionController::Base

  protect_from_forgery with: :null_session

  respond_to :json

  private

  def authenticate
    user = User.find_by(access_token: access_token)

    if user
      true
    else
      false
    end
  end

  def access_token
    request.headers['Authorization']
  end
end
