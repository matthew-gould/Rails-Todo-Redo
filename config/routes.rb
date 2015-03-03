Rails.application.routes.draw do
  
  devise_for :users
  
  root 'application#home'

  get '/new_list' => 'lists#new', as: 'new_list'
  post '/lists' => 'lists#create', as: 'lists'
  get '/lists' => 'lists#index'

  get '/lists/:id' => 'lists#show', as: 'list'

end
