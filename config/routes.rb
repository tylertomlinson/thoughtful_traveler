Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :user do
    get "/edit", to: "profile#edit"
    get "/", to: "dashboard#index"
    resources :trips, only: [:index,]
  end
end
