Rails.application.routes.draw do
  
  devise_for :users
  
  root 'application#home'

  get '/new_list' => 'lists#new', as: 'new_list'
  post '/lists' => 'lists#create', as: 'lists'
  get '/lists' => 'lists#index'
  get '/lists/:id' => 'lists#show', as: 'list'

  get '/lists/:list_id/new_item' => 'items#new', as: 'new_item'
  post '/lists/:list_id/items' => 'items#create', as: 'items'
  get '/items' => 'items#index', as: 'all_items'

  get '/items/random' => 'items#random', as: 'random_item'
  
  get '/items/:item_id' => 'items#show', as: 'item'
  get '/items/:item_id/edit' => 'items#edit', as: 'edit'
  patch '/items/:item_id' => 'items#update'

end
