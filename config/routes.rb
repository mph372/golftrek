Rails.application.routes.draw do
  resources :golf_courses do
    collection { post :import }
  end
  resources :itineraries
  resources :golf_clubs do
      collection { post :import }
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'home/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
