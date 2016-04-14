Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :activities
      resources :locations, only: [:index]
      resources :categories, only: [:index]
      resources :sessions, only: [:create]

      namespace :activity_search do
        resources :histories, only: [:index]
        resources :booked, only: [:index]
        resources :mine, only: [:index]
      end
    end
  end
end
