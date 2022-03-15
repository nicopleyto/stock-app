Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :path_prefix => 'devise'
  resources :users, only: [:index, :show, :edit, :update, :create, :new]
  resources :stocks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
