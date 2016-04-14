class Api::V1::SessionsController < Api::BaseController
  def create
    user = User.find_from_omniauth(auth_hash)
    sign_in(user)

    render json: { token: "" }
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
