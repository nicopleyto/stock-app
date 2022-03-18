Rails.application.routes.draw do
  get 'portfolio_stocks/index'
  get 'current_user_transactions/index'
  get 'transactions/index'

  
  get '/users/request/', to: 'users#show_request', as: 'users/request'
  root 'home#index'
  devise_for :users, :path_prefix => 'devise'
  resources :users, only: [:index, :show, :edit, :update, :create, :new]

  resources :stocks
  resources :pending_requests, only: [:index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
