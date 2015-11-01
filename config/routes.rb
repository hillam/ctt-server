Rails.application.routes.draw do
    root 'application#index'

    devise_for :users

    ## API Methods
    get 'sites',        to: 'sites#index'   # show all sites (day/week/month/year/ever)
    get 'sites/:id',    to: 'sites#show'    # show single site (day/week/month/year/ever)
    post 'sites',       to: 'sites#update'  # update using entire sites object
end
