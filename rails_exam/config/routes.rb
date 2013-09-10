RailsExam::Application.routes.draw do
  resources :cars do
    resources :comments
  end
end
