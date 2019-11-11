Rails.application.routes.draw do
  devise_for :users
  get 'admin/index'

  resources :accounts
  resources :entries
  resources :recurrent_entries
  resources :categories

  root 'admin#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
