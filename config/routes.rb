Rails.application.routes.draw do
  devise_for :users
 root "day_status#index" #トップページ

 resources :users, only: [:index, :create] #ユーザー登録のためのルーティング
  # indexアクションとcreateアクションのみを許可
  # indexアクションはユーザー一覧表示、createアクションはユーザー登録を行う
  # これにより、ユーザーの一覧表示と新規登録が可能になる
  # 他のアクションは許可されていないため、セキュリティが強化される
  # 例えば、showやeditアクションは許可されていないため、ユーザーの詳細表示や編集は行えない
  # これにより、ユーザーの情報を保護し、
  # 不要な操作を制限することができる
  # ルーティングの設定により、ユーザー登録のためのURLが
  # /user/indexと/user/createにマッピングされる
  # これにより、ユーザーは新規登録フォームにアクセスできるよう

  resources :day_statuses, only:[:index, :create]
  # 日付ステータスの一覧表示と新規登録を行うための
  # ルーティングを設定  
end
