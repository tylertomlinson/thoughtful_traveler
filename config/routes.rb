Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :user do
    get "/", to: "dashboard#index"
    get "/:id/edit", to: "dashboard#edit"
    resources :trips, only: [:index]
  end
end
