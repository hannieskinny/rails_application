RailsExam::Application.routes.draw do
  root :to => "cars#index"
  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  resources :cars do
    resources :comments
    resources :tags do
      member do
        delete :remove
      end
    end
    collection do
      get :search
    end
  end
  resources :users
  get "/signin", to: "sessions#create"

  namespace :api do
    namespace :v1 do
      resources :cars, defaults: { format: 'json' }
    end
  end
end
