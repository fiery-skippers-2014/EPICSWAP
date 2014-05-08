EpicSwap::Application.routes.draw do

  resources :users do
    resources :skills, only: [:create, :destroy]
    resources :interests, only: [:create, :destroy]
    resources :reputations, only: [:create]
  end

  match 'skills/autocomplete', to: 'skills#autocomplete', as: 'autocomplete', via: [:get]
  match 'interests/autocomplete', to: 'interests#autocomplete', as: 'interestauto', via: [:get]
  resources :interests, only: [:show, :index]
  resources :skills, only: [:show, :index]

  get '/usersData.:format', to: 'users#usersData', as: :usersData, constraints: { format: /json/ }

  get '/currentUserData.:format', to: 'users#currentUserData', as: :currentUserData, constraints: { format: /json/ }

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  match 'privacy', to: 'static_pages#privacy'
  match 'about', to: 'static_pages#about'
  match 'signout', to: 'sessions#destroy', via: [ :get, :post]
  match 'admin', to: 'admins#index', via: [:get, :post]
  root :to => 'users#index'
end
