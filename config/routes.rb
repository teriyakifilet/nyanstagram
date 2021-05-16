# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'cats#index'
  resources :users, only: %i[show edit update destroy] do
    resources :likes, only: [:index]
  end
  resources :cats, only: %i[new create show edit update destroy]
  resources :photos, only: %i[new create show edit update destroy] do
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end
end
