Rails.application.routes.draw do

  resources :users, accept: [:index, :create, :show, :update, :destroy] do
  resources :tasks
  end
 end
