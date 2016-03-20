Rails.application.routes.draw do
	root 'application#index'

	devise_for :users

	resources :users, only: [:show] do
		resources :sites, only: [:show]
	end

    ## API Methods
    get 'sites',        to: 'sites#index', defaults: {format: :json}   # show all sites
    post 'sites',       to: 'sites#update'  # update using entire sites object
	post 'sites/:id', 	to: 'sites#update_public'
	get 'checklogin', 	to: 'users#checklogin', defaults: {format: :json}

	get 'notifications',		to: 'notifications#index'
	post 'notifications',		to: 'notifications#create'
	post 'notifications/:id',	to: 'notifications#destroy'
end
