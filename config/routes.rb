Rails.application.routes.draw do

  post 'checkout', to: 'stripe#checkout'
  get  'checkout/success', to: 'stripe#success', as: 'successful_checkout'

  resources :sessions, only: [:new, :create, :destroy]
  get 'logout', to: 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'cookies', to: 'cookies#index'
  resources :authors, only: [ :index, :show, :new, :create ]
  # resources :recipes, only: [ :index, :show, :new, :create, :edit, :update ]
  resources :recipes
  root to: 'recipes#index'
end
