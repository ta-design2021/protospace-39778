Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  # get 'prototypes/index'
  # get ''
end
