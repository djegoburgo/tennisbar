Rails.application.routes.draw do
  resources :tournaments, only: [ :index, :show ]
end
