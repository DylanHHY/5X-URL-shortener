Rails.application.routes.draw do

  root to: 'home#index'
  resources :urls
  # resources :links
  post "/links", to: "links#create"
end
