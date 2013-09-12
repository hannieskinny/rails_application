RailsExam::Application.routes.draw do
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
end
