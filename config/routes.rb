Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/google_oauth2/callback', to: 'users#create'

  get '/', to: 'welcome#index'

  get '/dashboard', to: 'users#show'

  resources :items, only: [:new, :create]
end
