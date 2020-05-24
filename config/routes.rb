Rails.application.routes.draw do
  # devise_for :users
  root to: 'home#index'
  get 'users/new'
  get 'sessions/new'
  get '/signup',  to: 'users#new'
  get '/login',  to: 'users#new'
  # get    'login'   => 'sessions#new'
  # post   'login'   => 'sessions#create'
  # delete 'logout'  => 'sessions#destroy'

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # APIコントローラへのルーティング
  namespace :api, {format: 'json'} do
    post '/v1/libraries/category/:category', to: '/api/v1/libraries#show'
    post '/v1/libraries/city/:city', to: '/api/v1/libraries#show'
  #  検索機能
    get '/v1/libraries/', to: '/api/v1/libraries#search'
    get '/v1/libraries/:id', to: '/api/v1/libraries#show_detail'
    get '/v1/popularcities', to: '/api/v1/cities#show_popular_city' 
    get '/v1/cities', to: '/api/v1/cities#show' 
    namespace :v1 do
        resources :users, only: [:index, :show, :create]
        resources :employees, only: [:index, :show, :create, :update, :destroy]
        resources :libraries, only: [:index, :show]
        resources :cities, only: [:index]
        resources :categories, only: [:index]
      end
    end
end
