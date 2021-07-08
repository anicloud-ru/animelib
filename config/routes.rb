Rails.application.routes.draw do
  root to: 'dashboards#index'

  resources :animes
  resources :animes, only: %i[show] do
    member do
      get :arcs
    end
  end

  resources :arcs

  mount Sidekiq::Web => '/sidekiq'
end
