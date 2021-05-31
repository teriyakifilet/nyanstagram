# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'cats#index'
  resources :users, only: %i[show edit update destroy] do
    resources :likes, only: [:index]
    get 'following', to: 'relationships#index'
  end
  resources :cats, only: %i[new create show edit update destroy] do
    # フォロー関連
    post 'follow' => 'relationships#create'
    delete '/follow' => 'relationships#destroy'
  end
  resources :photos, only: %i[new create show edit update destroy] do
    # いいね関連
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end
end
