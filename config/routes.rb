Rails.application.routes.draw do
  resources :users, only:[:new, :create, :show] do
    resources :sessions, only:[:destroy]
  end
    resource :sessions, only:[:new, :create]
  resources :bands do
    resource :albums, only:[:new]
  end
  resources :albums do
    resource :tracks, only:[:new]
  end
  resources :tracks
end
