Rails.application.routes.draw do
  root to: 'home#index'
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # APIコントローラへのルーティング
  namespace :api, {format: 'json'} do
    post '/v1/libraries/category/:category', to: '/api/v1/libraries#show'
    post '/v1/libraries/city/:city', to: '/api/v1/libraries#show'
    get '/v1/libraries/:id', to: '/api/v1/libraries#show_detail'
    get '/v1/popularcities', to: '/api/v1/cities#show_popular_city' 
      namespace :v1 do
        resources :employees, only: [:index, :show, :create, :update, :destroy]
        resources :libraries, only: [:index, :show]
        resources :cities, only: [:index]
        resources :categories, only: [:index]
      end
    end
end
