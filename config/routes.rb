Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index"
  post '/login', to: 'welcome#login'
  get '/register', to: "users#new"
  # post '/register', to: "users#create"
  get '/dashboard', to: "users#dashboard"
  get '/login', to: "users#login"
  post '/login', to: "sessions#create"

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :edit] do
        post "/shots", to: "games/shots#create"
      end
      resources :users, only: [:index, :show, :update]
    end
  end
  resources :users, only: [:index, :create, :show, :edit, :update]
  resources :account_activations, only: [:edit]
end
