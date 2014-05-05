EpicSwap::Application.routes.draw do
  root :to => 'users#index'

  resources :users do
    resources :skills, only: [:create, :destroy]
    resources :interests, only: [:create, :destroy]
    resources :reputations, only: [:create]
  end

  match 'skills/autocomplete', to: 'skills#autocomplete', as: 'autocomplete', via: [:get]
  match 'interests/autocomplete', to: 'interests#autocomplete', as: 'interestauto', via: [:get]
  resources :interests, only: [:show]
  resources :skills, only: [:show]

  get '/usersData.:format', to: 'users#usersData', as: :usersData, constraints: { format: /json/ }

  get '/currentUserData.:format', to: 'users#currentUserData', as: :currentUserData, constraints: { format: /json/ }

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', via: [ :get, :post]
end
