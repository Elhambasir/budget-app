Rails.application.routes.draw do
  get 'splash/index'
  get 'groups/:group_id/expenses/:id', to: 'expenses#show', as: 'expense'
  get 'groups/:group_id/expenses', to: 'expenses#index', as: 'expenses'
  get 'groups/:group_id/expenses/new', to: 'expenses#new', as: 'new_expense'
  post 'groups/:group_id/expenses', to: 'expenses#create'
  get 'groups/:group_id/expenses/:id/edit', to: 'expenses#edit', as: 'edit_expense'
  resources :groups do
    resources :group_expenses
  end
  # resources :expenses
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
