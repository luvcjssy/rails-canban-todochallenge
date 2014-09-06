Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :challenges, :only => [:show, :new, :create, :index] do
  	resources :tasks, :only => [:index, :create, :update, :edit, :destroy]
  end
end
