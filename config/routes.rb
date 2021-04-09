Rails.application.routes.draw do
  root to: 'dashboards#index'

  resources :animes

  mount Sidekiq::Web => '/sidekiq'
end
