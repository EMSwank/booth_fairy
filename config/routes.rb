Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root 'welcome#index'

  get '/users' => 'users#index', as: :user_root # creates user_root_path

namespace :user do
  root 'users#index' # creates user_root_path
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
