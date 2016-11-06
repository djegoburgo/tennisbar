Rails.application.routes.draw do
  resources :tournaments, only: [ :index, :show ]  do
    resources :rounds, only: [ :index ] do
      resources :matchs, only: [ :index ]
    end
  end
end
