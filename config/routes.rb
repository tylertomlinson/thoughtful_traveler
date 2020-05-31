Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :user do
    get '/edit', to: 'profile#edit'
    patch '/', to: 'profile#update'
    get '/', to: 'dashboard#index'

    resources :trips, only: [:index, :new, :create, :edit]

    resources :upcoming_trips
    resources :past_trips
  end

  get '/login', to: 'login#index'
  get '/auth/facebook/callback' => 'sessions#omniauth'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
