Rails.application.routes.draw do
  devise_for :users
  # devise_for :installs
  get 'settings/index'
  resources :employees
  resources :jobs, only: [:new, :create, :destroy]
  resources :searches
  get 'jobs/settings'
  root to:"employees#index"
end
