Rails.application.routes.draw do
  resources :groups do
    resources :group_expenses
    resources :expenses
  end
  # resources :expenses
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "splash#index"
end
