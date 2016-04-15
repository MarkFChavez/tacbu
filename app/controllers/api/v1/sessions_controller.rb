class Api::V1::SessionsController < Api::BaseController
  def create
    user = User.find_by(auth_hash)

    if user
      sign_in(user, store: false)
    else
      return invalid_signin_error
    end

    render json: { api_key: user.api_key }
  end

  private

  def auth_hash
    params[:auth_hash]
  end
end
