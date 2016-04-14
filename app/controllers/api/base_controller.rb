class Api::BaseController < ActionController::Base

  protect_from_forgery with: :null_session

  respond_to :json

  private

  def authenticate
    uid, access_token = authorization.split(":")

    user = User.find_by(uid: uid)

    unless user
      user = User.create do |u|
        u.email = ""
        u.password = ""
        u.uid = uid
        u.access_token = access_token
      end
    end

    sign_in user, store: false
  end

  def authentication_error
    render json: { error: "Please sign in to continue." }, status: 401
  end

  def authorization
    request.headers['Authorization']
  end
end
