class Api::V1::SessionsController < Api::BaseController
  def create
    user = User.find_by(email: auth_hash["email"])

    if user && user.valid_password?(auth_hash["password"])
      sign_in(user, store: false)
    else
      return invalid_signin_error
    end

    render json: user
  end

  private

  def auth_hash
    params[:auth]
  end
end
