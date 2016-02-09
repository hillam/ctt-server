Rails.application.routes.draw do
    root 'application#index'

    devise_for :users

    ## API Methods
    get 'sites',        to: 'sites#index'   # show all sites
    get 'sites/:id',    to: 'sites#show'    # show single site
    post 'sites',       to: 'sites#update'  # update using entire sites object

	get 'notifications',		to: 'notifications#index'
	post 'notifications',		to: 'notifications#create'
	post 'notifications/:id',	to: 'notifications#destroy'
end
