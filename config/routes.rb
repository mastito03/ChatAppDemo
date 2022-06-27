Rails.application.routes.draw do
  get 'session/login'
  get 'session/logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rooms#index"

  resources "rooms", only: [:index, :new, :create] do
    resources "messages", only: [:index, :new, :create]
  end

  get "login", to: "session#login"
  post "login", to: "session#create"
  delete "logout", to: "session#destroy"
end
