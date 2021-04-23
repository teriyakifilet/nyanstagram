# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'cats#index'
  resources :cats, only: %i[new create]
end
