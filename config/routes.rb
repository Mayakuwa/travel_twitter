# getはデータベースを変更しないアクション
# postはデータベースを変更するアクション
Rails.application.routes.draw do

  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'

  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'


  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  # 投稿ページのフォームの値を受け取る
  post 'posts/create' => 'posts#create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  get '/' => 'home#top'
  get 'about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
