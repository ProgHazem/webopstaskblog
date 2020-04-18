# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'users/registrations'
  }
end
