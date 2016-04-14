class Api::V1::SessionsController < Api::BaseController
  def create
    user = User.find_from_omniauth(auth_hash)
    sign_in(user, store: false)

    render json: { api_key: user.api_key }
  end

  private

  def auth_hash
    { uid: params["userID"], access_token: params["accessToken"] }
  end
end
