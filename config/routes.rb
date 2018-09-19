Rails.application.routes.draw do
  # get 'markets/new'
  get 'users/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'welcome#index'

  get '/users' => 'users#index', as: :user_root # creates user_root_path
 
  resources :markets, only: [:show, :new, :index, :create] do
    resources :sales_day, only: [:new, :create]
  end

  namespace :user do
  root 'users#index' # creates user_root_path
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
