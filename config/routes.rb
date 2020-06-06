Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:        "admins/sessions",  #admins/sessionsはコントローラー名
    passwords:       "admins/passwords",
    registrations:   "admins/registrations"
  }

  devise_for :members, controllers: {
    sessions:        "members/sessions",
    passwords:       "members/passwords",
    registrations:   "members/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
end
