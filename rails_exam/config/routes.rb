RailsExam::Application.routes.draw do
  resources :cars
  resources :users
  get "/signin", to: "sessions#create"
end
