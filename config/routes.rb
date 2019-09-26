Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    resources :comments, only: [:create]
  end
  root 'blogs#index'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
