Rails.application.routes.draw do

  get '/products/new' => 'products#new'
  get '/products/:id' => 'products#show', as: "product"
  post '/products' => 'products#create'
  get '/products' => 'products#index'
  get '/search' => 'products#search'
  get '/searchproducts' => 'products#searchfor'

  get '/users/new' => 'users#new'
  get '/users/:id' => 'users#show', as: "user"
  post '/users' => 'users#create'
  get '/users' => 'users#index'

end
