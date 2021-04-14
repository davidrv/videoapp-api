# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists, except: [:edit, :update] do
    resources :items, except: [:edit, :update]
  end

  devise_for :users

  post 'account/upgrade', as: 'upgrade_account'
  get 'home/index'

  root to: "home#index"
end
