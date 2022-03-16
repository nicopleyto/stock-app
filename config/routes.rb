Rails.application.routes.draw do
  get 'stock/index'
  get '/users/request/', to: 'users#show_request', as: 'users/request'
  root 'home#index'
  devise_for :users, :path_prefix => 'devise'
  resources :users, only: [:index, :show, :edit, :update, :create, :new, :request]

  resources :users do
    member do
      patch :update_state
    end
  end
  resources :stocks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
