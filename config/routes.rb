Rails.application.routes.draw do
  devise_for :users
  
  resources :categories do
    resources :tasks
  end

  
  # get '/categories', to: 'categories#index'
  # get '/categories/new', to: 'categories#new'
  # post '/categories', to: 'categories#create'
  # get '/categories/:id', to: 'categories#show', as: 'category'
  # get '/categories/:id/edit', to: 'categories#edit'
  # get '/categories/:id', to:  'categories#show'
  # patch '/categories/:id', to: 'categories#update'
  # delete '/categories/:id', to: 'categories#destroy'

end
