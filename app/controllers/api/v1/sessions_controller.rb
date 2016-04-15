class Api::V1::SessionsController < Api::BaseController
  def create
    user = User.from_omniauth(auth_hash)

    if user
      sign_in(user, store: false)
    else
      return authentication_error
    end

    render json: { api_key: user.api_key }
  end

  private

  def auth_hash
    { 
      uid: params["userID"], 
      name: params["name"],
      email: params["email"],
      image: params["image"]
    }
  end
end
