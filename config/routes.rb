Rails.application.routes.draw do
  root to: 'policies#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :sessions, only: :new
end
