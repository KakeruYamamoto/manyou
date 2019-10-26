Rails.application.routes.draw do

  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end

  root to: 'sessions#new'
end
