Rails.application.routes.draw do
  resources :favorite_courses
  get 'line_items/new' => "line_items#new"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  get 'search_by_city' => "golf_clubs#index"
  get 'search_by_course' => "golf_courses#index"
  
  resources :golf_courses do
    collection { post :import }
  end
  resources :itineraries
  get 'itineraries/:id' => "itineraries#show", as: "itienrary"
  delete 'itineraries/:id' => "itineraries#destroy"

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
