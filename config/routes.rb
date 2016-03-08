Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :profile do
    get '/jobs', to: 'jobs#index'
    get '/jobs/new', to: 'jobs#new'
    post '/jobs/create', to: 'jobs#create'
    post '/jobs/:id/edit', to: 'jobs#edit'
    patch '/bids/:id/accept', to: 'bids#accept'
  end

  namespace :owner do
    get '/', to: 'users#owners'
    get '/:id', to: 'users#show_owners'
    get '/:id/bids', to: 'bids#show'
    get '/drones/new', to: 'drones#new'
    post '/drones/create', to: 'drones#create'
    get '/drones/:id', to: 'drones#show'
  end
end
