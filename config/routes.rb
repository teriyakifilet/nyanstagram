# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'cats#index'
  resources :users, only: %i[show]
  resources :cats, only: %i[new create show]
  resources :photos, only: %i[new create show edit update destroy]
end
