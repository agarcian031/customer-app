Rails.application.routes.draw do
  devise_for :users
  root "customers#index"
  resources :customers 
end
