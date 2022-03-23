Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :path_prefix => 'devise'
  resources :users, only: [:index, :show, :edit, :update, :create, :new]



  resources :portfolio_stocks
  resources :current_user_transactions, only: [:index, :show]
  resources :transactions, only: [:index, :show]
  resources :stocks, only: [:index, :show]
  resources :pending_requests, only: [:index, :update]
  resources :declined_requests, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
