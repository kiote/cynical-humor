CynicalHumor::Application.routes.draw do  
  resources :users
  resources :posts
  resources :sessions

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"

  root :to => "posts#index"
end
