Rails.application.routes.draw do

    post 'earthquakes/earthquake', to: 'v1/earthquakes#earthquake'

end
