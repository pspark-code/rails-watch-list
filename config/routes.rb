Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/lists', to: 'lists#index'
  get 'lists/new', to: 'lists#new'
  get '/lists/:id', to: 'lists#show', as: :list
  post 'lists', to: 'lists#create'
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
