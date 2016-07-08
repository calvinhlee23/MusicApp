Rails.application.routes.draw do
  resources :users, only:[:new, :create, :show]
  resources :session, only:[:new, :create, :destroy]
  resources :bands
  resources :albums
  resources :tracks
end
