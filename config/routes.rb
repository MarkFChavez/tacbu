Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      get "/users/me" => "users#show"
      resources :activities

      namespace :activity_search do
        resources :histories, only: [:index]
      end
    end
  end
end
