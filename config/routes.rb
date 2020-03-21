Rails.application.routes.draw do
  devise_for :users

  as :users do
    resources :travels
  end

    # for visitors ? visible for everyone
  # resources :travels, only: [ :new, :create, :show ]

  resources :countries, only: [ :index, :show ] do
    resources :visas, only: [ :index, :show ]
  end

  resources :vaccines, only: [ :index, :show ]

  root to: 'pages#maintenance'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
