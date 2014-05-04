EpicSwap::Application.routes.draw do
  root :to => 'users#index'

  resources :users do
    resources :skills, only: [:create]
    resources :interests, only: [:create]
    resources :reputations, only: [:create]
  end

  resources :interests, only: [:show]
  resources :skills, only: [:show]

  get '/usersData.:format', to: 'users#usersData', as: :usersData, constraints: { format: /json/ }

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
