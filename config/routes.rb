Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
# メッセージ送信機能の実装に必要なルーティングは、以下の通りです。
# 投稿されたメッセージの一覧表示 & メッセージの入力ができる:index
# メッセージの保存を行う:create
  end
end
