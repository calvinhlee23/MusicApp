Rails.application.routes.draw do
  root to: redirect("/bands")

  resources :users, only:[:new, :create, :show]

  resource :session, only:[:new, :create, :destroy]

  resources :bands do
    resource :albums, only:[:new]
  end
  resources :albums do
    resource :tracks, only:[:new]
  end
  resources :tracks
end
