Rails.application.routes.draw do
 
   resources :movies

  get 'auth/:provider/callback',to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy',as: 'signout'
  root 'movies#index'
end



