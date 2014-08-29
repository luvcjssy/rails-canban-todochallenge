Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :challenges, :only => [:show, :new, :create]
end
