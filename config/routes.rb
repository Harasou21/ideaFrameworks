Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "mandalarts#index"
  resources :mandalarts

  get '/mindmaps', to: 'mindmaps#index'

  namespace :api, format: 'json' do
    resources :mindmaps
  end
  resources :users
end
