Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes
  # get 'prototypes/index'
  # get ''
end
