Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }


  scope "(:locale)", locale: /en|es/ do

    authenticated :user do
      # get '/:locale' => 'travels#index', as: :authenticated_root
      root to: 'travels#index', as: :authenticated_root
      get 'profil' => 'users#show'
    end

    unauthenticated do
      # get '/:locale' => 'pages#maintenance'
      root to: 'pages#maintenance'
    end


    as :users do
      resources :travels do
        resources :travel_countries
      end
      resources :documents
      resources :travels_countries do
        resources :visas do
          resources :visa_progressions
        end
      end
    end


    resources :countries, only: [ :index, :show ] do
      resources :visas, only: [ :index, :show ]
    end

    resources :vaccines, only: [ :index, :show ]
    get "/confidentialite", to: "pages#confidentiality"
  end



  # Routes for Google authentication
  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  # get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
