Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'user'

  resources :users, only: %i[create show update destroy]
  resources :artists, only: %i[index show]
  resources :songs, only: %i[index show]

  namespace :internal do
    resources :artists
    resources :songs
    resources :artist_songs
  end
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
