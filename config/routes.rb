Rails.application.routes.draw do
  resources :projects
  resources :project_groups
  resources :customers
  get 'tasks/next', 'tasks#next'
  post 'tasks/comment', 'tasks#comment'
  root to: 'home#index'
end
