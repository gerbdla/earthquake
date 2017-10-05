Rails.application.routes.draw do

    get 'earthquakes', to: 'v1/earthquakes#earthquake'

end
