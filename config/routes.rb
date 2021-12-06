Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "mandalarts#index"
  resources :mandalarts

  get '/mindmaps', to: 'mindmaps#index'

  resources :api, format: 'json' do
    resources :mindmaps ,only: [:index]
  end
end
