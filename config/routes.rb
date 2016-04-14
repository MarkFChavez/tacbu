Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      get "/users/me" => "users#show"
      resources :activities
      resources :locations, only: [:index]
      resources :categories, only: [:index]

      namespace :activity_search do
        resources :histories, only: [:index]
        resources :booked, only: [:index]
        resources :mine, only: [:index]
      end
    end
  end
end
