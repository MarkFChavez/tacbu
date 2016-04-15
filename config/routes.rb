Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :activities
      resources :locations, only: [:index]
      resources :categories, only: [:index]
      resources :sessions, only: [:create]

      get "/users/me" => "me#show"

      namespace :activity_search do
        resources :histories, only: [:index]
        resources :booked, only: [:index]
        resources :mine, only: [:index]
      end

      namespace :joiner do
        resources :activity_participations, only: [:create]
        resources :activity_invitations, only: [:update]
      end
    end
  end
end
