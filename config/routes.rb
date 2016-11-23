Rails.application.routes.draw do

  # post    "selection/create",      to: "selection#create"


  resources :tournaments, only: [ :index, :show ]  do
    resources :rounds, only: [ :index ] do
      resources :matchs, only: [ :show ] do
        resources :firstentrys, only: [ :show ]
          # resource :player, only: [ :show ]
        resources :secondentrys, only: [ :show ]
          # resource :player, only: [ :show ]
        #   end
        # end
      end
    end
  end
end
