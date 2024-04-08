Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'policies#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :policies, only: %i[new create]
end
