Rails.application.routes.draw do
  root to: 'home#index'
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # APIコントローラへのルーティング
    namespace :api, {format: 'json'} do
      namespace :v1 do
        resources :employees, only: [:index, :show, :create, :update, :destroy]
      end
    end
end
