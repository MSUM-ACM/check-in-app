Rails.application.routes.draw do
  root to: "users#new"

  resources :users do
    collection do
      get 'remove_all'
    end
  end
end
