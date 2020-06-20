Rails.application.routes.draw do

  root "home#top"
  devise_for :admins, controllers: {
    sessions:        "admins/sessions",
    passwords:       "admins/passwords",
    registrations:   "admins/registrations"
  }
  namespace :admins do
    resources :members, only: [:index, :show, :edit, :update]
    resources :posts, only: [:new, :create, :index, :show, :edit, :update]
    resources :types, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  get "admins/top" => "admins/members#top", as: "admins_top"

  devise_for :members, controllers: {
    sessions:        "members/sessions",
    passwords:       "members/passwords",
    registrations:   "members/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members, only: [:show, :edit, :update]do
   member do
    get :following, :followers
   end
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end
