Rails.application.routes.draw do
  resources :projects
  resources :project_groups
  resources :customers
  root to: 'home#index'
end
