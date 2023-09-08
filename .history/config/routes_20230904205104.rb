Rails.application.routes.draw do
  root to: "prototypes#index"
  devise_for :users
  # get 'prototypes/index'
  # get ''
end
