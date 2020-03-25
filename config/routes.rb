Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  as :users do
    resources :travels
    resources :documents
  end

    # for visitors ? visible for everyone
  # resources :travels, only: [ :new, :create, :show ]

  resources :countries, only: [ :index, :show ] do
    resources :visas, only: [ :index, :show ]
  end

  resources :vaccines, only: [ :index, :show ]

  authenticated :user do
    root to: 'travels#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'pages#maintenance'
  end


  # Routes for Google authentication
  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  # get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
