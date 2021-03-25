# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists, except: [:edit, :update]
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
