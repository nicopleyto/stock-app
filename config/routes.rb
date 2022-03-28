Rails.application.routes.draw do
  root 'stocks#index'
  devise_for :users, :path_prefix => 'devise'
  resources :users, only: [:index, :show, :edit, :update, :create, :new]

  resources :portfolio_stocks do
    member do
      get 'buy'
      get 'sell'
      patch 'confirm_sell'
    end
  end

  resources :balance, only: [:show] do
    member do
      get 'withdraw'
      get 'topup'
      patch 'confirm_topup'
      patch 'confirm_withdraw'
    end
  end

  resources :current_user_transactions, only: [:index, :show]
  resources :transactions, only: [:index, :show]
  resources :stocks, only: [:index, :show]
  resources :pending_requests, only: [:index, :update]
  resources :declined_requests, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
