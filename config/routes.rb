# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :backoffice do
    get 'admins/index'
  end
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: %i[edit create]
    resources :categories, except: %i[show destroy]
    resources :admins, except: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: %i[index edit update]
    end
  end

  devise_for :admins, skip: [:registration]
  devise_for :members

  root 'site/home#index'
end
