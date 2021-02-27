Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  #devise_for :users
  namespace :v1, defaults: {format: :json} do
    resources :calendars
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create, :show]
    resources :tasks
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
