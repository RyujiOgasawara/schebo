Rails.application.routes.draw do  #Rails.application.routes.draw do
  devise_for :users #rails g devise user で自動的に設定される
  root 'cards#index'  #root 'cards#index'


  #'cards#show'より前に記述
  get 'cards/ext_sales'
  get 'cards/ext_const'
  get 'cards/ext_eng'
  get 'cards/ext_acct'
  get 'cards/ext_other'
  #ここまで
  get 'cards/admin'   #管理者画面
  
  patch 'cards/status_out/:id', to: 'cards#status_out'  # 外出
  get 'cards/status_in_office/:id', to: 'cards#status_in_office'  # 社内
  get 'cards/status_go_home/:id', to: 'cards#status_go_home' # 帰宅
  
  get 'cards/index'
  get 'cards', to: 'cards#index'

  get 'cards/add'
  post 'cards/add'

  get 'cards/:id', to: 'cards#show'

  get 'cards/edit/:id', to: 'cards#edit'
  patch 'cards/edit/:id', to: 'cards#edit'
  
  get 'cards/profile_edit/:id', to: 'cards#profile_edit'
  patch 'cards/profile_edit/:id', to: 'cards#profile_edit'

  get 'cards/delete/:id', to: 'cards#delete'
end
