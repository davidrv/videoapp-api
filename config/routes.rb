# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get ':list_id/videos' => 'videos#index'
      get ':list_id/videos/:id' => 'videos#show'
    end
  end

  resources :lists do
    resources :items, except: [:edit, :update]
  end

  devise_for :users

  post 'account/upgrade', as: 'upgrade_account'
  get 'home/index'

  root to: "home#index"
end
