Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/:id', to: 'merchants#show'
  # get '/merchants/:id/items', to: 'merchants/items#index'
  get '/items/:id', to: 'items#show'
end
