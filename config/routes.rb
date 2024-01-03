Rails.application.routes.draw do
  root 'web/books#index'

  scope module: :web do
    resources :books, except: [:index] do
      resources :pages, only: [:index, :new, :create]
    end

    resources :books, except: [:index], shallow: true do
      resources :pages, only: [:show, :edit, :update, :destroy]
    end
  end
  #scope :books do
  #  resources :pages, only: [:show, :edit, :update, :destroy]
  #end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
