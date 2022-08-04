Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/google_oauth2/callback', to: 'users#create'

  get '/auth/twitter/callback', to: 'users#create', via: 'get'

  get '/', to: 'welcome#index'

  get '/dashboard', to: 'users#show'
  delete '/users', to: 'users#destroy'

  delete '/items', to: 'items#destroy'

  resources :items, only: [:new, :create]

  resources :groceries, only: [:index, :create, :destroy]
  
  get '/recipe_search', to: 'recipe_search#show'
  get '/recipe_search/index', to: 'recipe_search#index'

  get '/foodbanks', to:'foodbanks#search'
  get '/foodbanks/index', to: 'foodbanks#index'
  get '/foodbanks/:id', to: 'foodbanks#show'

  get '/foodbanks/search', to:'foodbanks#search'

  get '/resources', to: 'resources#index'

  resources :recipes, only: [:show]
end
