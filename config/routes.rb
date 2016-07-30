Rails.application.routes.draw do
 
	resources :movies

	get 'auth/:provider/callback',to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy',as: 'signout'
	root 'movies#index'


	get "/contacts/:importer/callback" => "movies#contact", :via => [:get]
    get "/oauth2callback" => "movies#contact", :via => [:get]#gmail
    get "/callback" => "movies#contact_yahoo", :via => [:get]#yahoo

	# get "/movies/:provider/contact_callback" => "movies#index"
	#get "/contacts/failure" => "movies#failure"
end



