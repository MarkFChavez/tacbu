Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      get "/users/me" => "users#show"
      resources :activities
    end
  end
end
