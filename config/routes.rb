Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "sessions/new"
  # get "user/new"
  # get "static_pages/home"
  # get "static_pages/help"
  # get "static_pages/about"
  # get "static_pages/contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

# 
  root "static_pages#home"

 
  # root controller#action
  # root controller: "application", action: :hello
  get "/help", to: "static_pages#help", as: 'helf'
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # these 3 routes for sessions , get for login form, post for login done, delete for destroy session.
  resources :users

  resources :account_activations, only: [:edit]
  # GET /account_activations/:id/edit
  # :id is just a activation token , which send with link

  resources :password_resets, only: [:new, :edit, :create, :update]

#   | Action | URL                            | HTTP Method | Named Route                      |
# | ------ | ------------------------------ | ----------- | -------------------------------- |
# | new    | `/password_resets/new`         | GET         | `new_password_reset_path`        |
# | create | `/password_resets`             | POST        | `password_resets_path`           |
# | edit   | `/password_resets/:token/edit` | GET         | `edit_password_reset_url(token)` |
# | update | `/password_resets/:token`      | PATCH       | `password_reset_path(token)`     |


# this creates two named routes, help_path and help_url:
# help_path -> '/help'
# help_url -> 'http://www.example.com/help'
end


# get 'static_pages/home'
# get '/home' => 'static_pages#home'
# get '/home', to: 'static_pages#home'


# _path → use inside your app (redirects, link_to within pages).
# _url → use outside the app, like emails, because the full address is needed.


