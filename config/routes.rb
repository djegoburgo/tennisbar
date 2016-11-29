Rails.application.routes.draw do

  resources :selections, only: [ :destroy ] do
   resources :players, only: [ :destroy ]
  end

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
