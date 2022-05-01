Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "mandalarts#index"
  resources :mandalarts

  get '/mindmaps', to: 'mindmaps#index'

  namespace :api, format: 'json' do
    resources :mindmaps
  end
  resources :users

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
end
