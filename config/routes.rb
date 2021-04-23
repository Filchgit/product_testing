Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  
  get 'products/calculate'
  resources :products, only: [ :new, :create, :calculate ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
