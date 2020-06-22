Rails.application.routes.draw do

  get 'friendships/new'
  get 'friendships/create'
  get 'friendships/update'
  #get 'friendships/destroy'
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :friendships, only:[:create, :update]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
