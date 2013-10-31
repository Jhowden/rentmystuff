Stuffwithfriends::Application.routes.draw do
  resources :items
  get '/logout', :to => "sessions#destroy"
  get '/auth/:provider/callback', :to => "sessions#create"
  get '/auth/failure', redirect('/')

  root :to => 'pages#index'
end
