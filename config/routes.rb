Rails.application.routes.draw do
  root to: 'dashboards#index'

  resources :animes
  resources :animes, only: %i[show] do
    member do
      get :arcs
      resources :arcs, only: %i[new]
      get 'arcs/:arc_id', action: 'arc'
    end
  end

  resources :arcs, only: %i[create]

  mount Sidekiq::Web => '/sidekiq'
end
