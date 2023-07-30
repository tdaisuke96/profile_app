Rails.application.routes.draw do
  #root "profile_pages#index" #未ログインページ要実装
  root 'profile_pages#show'
  
  #profile_pages : ユーザーごとのトップページ
    #get : show
    #loginした時の処理
    # pfofile_imageとしてユーザーごとの画像URLを生成
  get '/profile_pages/:id', to: 'profile_pages#show'#未実装
  get '/profile_pages/:id/profile_image', to: 'profile_pages#send_image', as: 'profile_image'

  #user_profile : ユーザーごとの自己紹介編集ページ
    #get : show
    #put, patch : update
    #memo : get '/user_profile/index'
  # get "/user_profile", to: "user_profile#index"
  put '/user_profile/:id', to: 'user_profile#update'#不要
  # get '/user_profile/:id', to: 'user_profile#show' #不要
  get '/user_profile/:id/edit', to:'user_profile#edit', as: 'user_profile_edit'


# ※下記全面見直し
  # user_skill : ユーザーごとの各カテゴリのスキル一覧画面
    #get /:id : show #ユーザースキル一覧画面
    #put, patch /:id: update
    #delete /:id : destroy
    
    #get /:id/edit : edit #スキル追加画面
    #post /:id/edit : create #スキル追加処理
    #memo : get '/user_skill/index'


  # get '/user_skill', to: 'user_skill#index', as: 'user_skill'
  # get '/user_skill/:id', to: 'user_skill#show' #未実装 
  # put '/user_skill/:id', to: 'user_skill#update'#未実装
  # patch '/user_skill/:id', to: 'user_skill#update'#未実装
  # delete '/user_skill/:id', to: 'user_skill#destroy'#未実装
  
  get '/user_skill/:id/edit', to: 'user_skill#edit', as: 'user_skill_edit'#未実装
  # post '/user_skill/:id/edit', to: 'user_skill#create'#未実装
  put '/user_skill/:id/edit', to: 'user_skill#update'#未実装
  patch '/user_skill/:id/edit', to: 'user_skill#update'#未実装
  delete '/user_skill/:id/edit', to: 'user_skill#destroy'#未実装

  # post 'user_skill/:category_id', to: 'user_skill#create', as: 'user_skill'
  # get '/user_skill/:category_id/new', to: 'user_skill#new', as: 'user_skill_new' #as:user_skill_new??  

  post 'user_skill/:id/category/:category_id', to: 'user_skill#create', as: 'user_skill'
  get '/user_skill/:id/category/:category_id/new', to: 'user_skill#new', as: 'user_skill_new'
  
  get '/signup', to: 'users#new'
  
  #user_profileからusersモデルを取得できるようにコントローラーで処理追加する

end
