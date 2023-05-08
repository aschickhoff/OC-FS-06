Rails.application.routes.draw do
  devise_for :users , :controllers => {registrations: "registrations" }
  resources :activity_names
  resources :activities
  root "home#index"

  get "/about", to: "home#about"
  get "*path", to: "errors#not_found", via: :all

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
