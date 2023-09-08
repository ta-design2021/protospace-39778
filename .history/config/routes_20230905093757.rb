Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  # esourcesは、7つのアクションへのルーティングを自動生成するメソッドです。resourcesの引数に、:tweetsというシンボルを指定すると/tweetsのパスに対応するルーティングが生成されます。
  # resources :prototypes
  # get 'prototypes/index'
end
