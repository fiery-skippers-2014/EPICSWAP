EpicSwap::Application.routes.draw do
  root :to => 'users#index'
  resources :users do
    resources :skills
    resources :interests
  end

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
