Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  # resourcesは、7つのアクションへのルーティングを自動生成するメソッドです。resourcesの引数に、:tweetsというシンボルを指定すると/tweetsのパスに対応するルーティングが生成されます。
  resources :prototypes, only: [:index, :new, :create, :show]
  # get 'prototypes/index'
end
