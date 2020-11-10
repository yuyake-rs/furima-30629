Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :edit, :update]
end
